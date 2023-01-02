import SwiftUI

struct EditDesignView: View {

    @Environment (\.managedObjectContext) var managedObjectContext

    var design: FetchedResults<Design>.Element
    
    // Binding variables
    @State private var title = ""
    @State private var area: String = ""
    @State private var people: String = ""
    @State private var roomWidth: String = ""
    @State private var roomDepth: String = ""
    @State private var screenDiagonal: String = ""
    @State private var screenWidth: String = ""
    @State private var screenHeight: String = ""
    @State private var screenWall: String = ""
    @State private var aspectRatio: String = ""
    @State private var lamps: String = ""
    @State private var lfe: Bool = true
    @State private var lampsPerWall = ""
    
    // DisclosureGroup states
    @State var general: Bool = true
    @State var roomDimentions: Bool = true
    @State var screenProperties: Bool = true
    @State var lighting: Bool = true
    @State var soundSystem: Bool = true

    var body: some View {
        List {
            Form {
                VStack {
                    
                    // Title and People DONE
                    Group {
                        DisclosureGroup(isExpanded: $general) {
                            Spacer()
                            // Title
                            VStack(alignment: .leading) {
                                Text("   Name:")
                                TextField("",text: $title)
                            }.padding(.bottom, 10.0)
                            
                            // People
                            VStack(alignment: .leading) {
                                Text("   Number of people:")
                                TextField("", text: $people, prompt: Text("\(design.people)"))
                            }.padding(.bottom, 10.0)
                        }
                    label: {
                        Label("General", systemImage: "pencil.circle.fill")
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray).opacity(0.1))
                    }
                    
                    // Room Dimentions DONE
                    Group {
                        DisclosureGroup(isExpanded: $roomDimentions) {
                            Spacer()
                            HStack {
                                // Width
                                VStack(alignment: .leading) {
                                    Text("   Room Width:")
                                    TextField("", text: $roomWidth, prompt: Text("\(design.roomWidth)"))
                                }.padding(.bottom, 10.0)
                                
                                // Depth
                                VStack(alignment: .leading) {
                                    Text("   Room Depth:")
                                    TextField("", text: $roomDepth, prompt: Text("\(design.roomDepth)"))
                                }.padding(.bottom, 10.0)
                            }
                            
                            // Area
                            VStack(alignment: .leading) {
                                Text("   Area:")
                                TextField("", text: $area, prompt: Text("\(design.area)"))
                            }.padding(.bottom, 10.0)
                        }
                    label: {
                        Label("Room Dimensions", systemImage: "square.split.bottomrightquarter.fill")
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .opacity(0.1)
                    )
                    }
                    
                    // Screen Properties
                    Group {
                        DisclosureGroup(isExpanded: $screenProperties) {
                            Spacer()
                            
                            // Screen Diagonal inch CONVERT TO CM
                            VStack(alignment: .leading) {
                                Text("   Screen Diagonal:")
                                TextField("", text: $screenDiagonal, prompt: Text("\(design.screenDiagonal)"))
                            }.padding(.bottom, 10.0)
                            
                            // Screen width
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("   Screen Width:")
                                    TextField("", text: $screenWidth, prompt: Text("\(design.screenWidth)"))
                                }.padding(.bottom, 10.0)
                                // Screen height
                                VStack(alignment: .leading) {
                                    Text("   Screen Height:")
                                    TextField("", text: $screenHeight, prompt: Text("\(design.screenHeight)"))
                                }.padding(.bottom, 10.0)
                            }
                            // aspect ratio
                            VStack(alignment: .leading) {
                                Text("   Aspect ratio:")
                                Picker(selection: $aspectRatio, label: Text("")) {
                                    Text("16:9").tag("16:9")
                                    Text("3:4").tag("3:4")
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }.padding(.bottom, 10.0)
                            // min and max throw distance
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("   Minimum Throw Distance:")
                                    TextField("", text: $screenDiagonal, prompt: Text("\(design.screenDiagonal)"))
                                }
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("   Maximum Throw Distance:")
                                    TextField("", text: $screenDiagonal, prompt: Text("\(design.screenDiagonal)"))
                                }
                            }.padding(.bottom, 10.0)
                            
                            // Screen Position
                            VStack(alignment: .leading) {
                                Text("   Screen position:")
                                Picker(selection: $screenWall, label: Text("")) {
                                    Text("Front").tag("Front")
                                    Text("Back").tag("Back")
                                    Text("Left").tag("Left")
                                    Text("Right").tag("Right")
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }.padding(.bottom, 10.0)
                        }
                    label: {
                        Label("Screen Properties", systemImage: "tv.and.mediabox.fill")
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .opacity(0.1)
                    )
                    }
                    
                    // Lamps
                    Group {
                        DisclosureGroup(isExpanded: $lighting) {
                            Spacer()
                            // Total amount of lamps
                            VStack(alignment: .leading) {
                                Text("   Number of lamps:")
                                TextField("", text: $lamps, prompt: Text("\(design.lamps)"))
                            }.padding(.bottom, 10.0)
                            
                            // lamps per location
                            VStack(alignment: .leading) {
                                Text("   Front:")
                                TextField("", text: $lampsPerWall)
                                Text("   Back:")
                                TextField("", text: $lampsPerWall)
                                Text("   Left and Right:")
                                TextField("", text: $lampsPerWall)
                            }.padding(.bottom, 10.0)
                        }
                    label: {
                        Label("Lighting", systemImage: "lightbulb.led.wide.fill")
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .opacity(0.1)
                    )
                    }
                    
                    // Sound
                    Group {
                        DisclosureGroup(isExpanded: $soundSystem) {
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("   Number of channels:")
                                TextField("", text: $lamps, prompt: Text("\(design.lamps)"))
                            }.padding(.bottom, 10.0)
                            
                            // channels per location
                            VStack(alignment: .leading) {
                                Text("   Front:")
                                TextField("", text: $lamps, prompt: Text("\(design.lamps)"))
                                Text("   Back:")
                                TextField("", text: $lamps, prompt: Text("\(design.lamps)"))
                                Text("   Left and Right:")
                                TextField("", text: $lamps, prompt: Text("\(design.lamps)"))
                            }.padding(.bottom, 10.0)
                            // Subwoofer
                            Toggle(isOn: $lfe) {
                                Label("Low frequency channel", systemImage: "homepod.fill")
                            }
                        }
                    label: {
                        Label("Sound system", systemImage: "hifispeaker.2.fill")
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray)
                        .opacity(0.1)
                    )
                    }
                }
                
                // Sumbit Button
                Group {
                  HStack {
                    Spacer()
                    Button("Submit") {
                      DataController().editDesign(design: design, title: title, roomDepth: roomDepth, roomWidth: roomWidth, screenDiagonal: screenDiagonal, screenWidth: screenWidth, screenHeight: screenHeight, area: area, people: people, lamps: lamps, lampsPerWall: lampsPerWall, screenWall: screenWall, aspectRatio: aspectRatio, lfe: lfe, context: managedObjectContext)
                        updateDesignValues(design: design)
                    }.padding(.horizontal)
                  }
                  .onAppear {
                    updateDesignValues(design: design)
                  }
                  .onChange(of: design) { design in
                    updateDesignValues(design: design)
                  }
                }
                .padding(.top, 10)
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                    general.toggle()
                    roomDimentions.toggle()
                    screenProperties.toggle()
                    lighting.toggle()
                    soundSystem.toggle()
                    
                }, label: {
                    Label("Toggle", systemImage: "togglepower")
                })
            }
        }
    }

    
    func updateDesignValues(design: Design) {
        title = design.title ?? ""
        roomDepth = String(design.roomDepth)
        roomWidth = String(design.roomWidth)
        area = String(design.area)
        screenWall = design.screenWall ?? ""
        aspectRatio = design.aspectRatio ?? ""
        screenDiagonal = String(design.screenDiagonal)
        screenWidth = String(design.screenWidth)
        screenHeight = String(design.screenHeight)
        people = String(format: "%.f", design.people)
        lamps = String(format: "%.f", design.lamps)
        lampsPerWall = design.lampsPerWall!
        lfe = design.lfe
    }
}
