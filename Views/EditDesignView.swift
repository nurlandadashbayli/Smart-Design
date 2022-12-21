//
//  EditDesignView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 18.11.22.
//

import SwiftUI

struct EditDesignView: View {

    @Environment (\.managedObjectContext) var managedObjectContext

    var design: FetchedResults<Design>.Element

    @State private var title = ""
    @State private var area: String = ""
    @State private var people: String = ""
    @State private var roomWidth: String = ""
    @State private var roomDepth: String = ""
    @State private var screenDiagonal: String = ""
    @State private var screenWall: String = ""
    @State private var lamps: String = ""

    var body: some View {
        List {
            Form {
                VStack {
                    GroupBox() {
                        // Title
                        VStack(alignment: .leading) {
                            Text("   Name:")
                            TextField("",text: $title)
                        }.padding(.bottom, 10.0)
                    }
                    
                    GroupBox() {
                        // People
                        VStack(alignment: .leading) {
                            Text("   Number of people:")
                            TextField("", text: $people, prompt: Text("\(design.people)"))
                        }.padding(.bottom, 10.0)
                    }
                    
                    // Room Dimentions
                    DisclosureGroup("Room Dimensions") {
                        Spacer()
                        GroupBox {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("   Room Width:")
                                    TextField("", text: $roomWidth, prompt: Text("\(design.roomWidth)"))
                                }.padding(.bottom, 10.0)
                                
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
                        }//.fontWeight(.bold)
                    }
                    
                    // Screen Properties
                    DisclosureGroup("Screen Properties") {
                        Spacer()
                        GroupBox {
                            // Screen Diagonal
                            VStack(alignment: .leading) {
                                Text("   Screen Diagonal:")
                                TextField("", text: $screenDiagonal, prompt: Text("\(design.screenDiagonal)"))
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
                    }
                    // Lamps
                    VStack(alignment: .leading) {
                        Text("   Number of lamps:")
                        TextField("", text: $lamps, prompt: Text("\(design.lamps)"))
                    }.padding(.bottom, 10.0)
                }
                .padding()
                
                // Sumbit Button
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().editDesign(design: design, title: title, roomDepth: roomDepth, roomWidth: roomWidth, screenDiagonal: screenDiagonal, area: area, people: people, lamps: lamps, screenWall: screenWall, context: managedObjectContext)
                        // update all text field values
                        screenDiagonal = String(design.screenDiagonal)
                        area = String(design.area)
                        people = String(format: "%.f", design.people)
                        lamps = String(format: "%.f", design.lamps)
                    }.padding(.horizontal)
                }
                
                    // Insert the value of the screen diagonal from the database here for the selected design
                    .onAppear() {
                        title = design.title!
                        roomDepth = String(design.roomDepth)
                        roomWidth = String(design.roomWidth)
                        screenWall = design.screenWall!
                        area = String(design.area)
                        screenDiagonal = String(design.screenDiagonal)
                        people = String(format: "%.f", design.people)
                        lamps = String(format: "%.f", design.lamps)
                    }
                
                    // Update the values according to the next selected design
                    .onChange(of: design) { design in
                        title = design.title!
                        roomDepth = String(design.roomDepth)
                        roomWidth = String(design.roomWidth)
                        screenWall = design.screenWall!
                        area = String(design.area)
                        screenDiagonal = String(design.screenDiagonal)
                        people = String(format: "%.f", design.people)
                        lamps = String(format: "%.f", design.lamps)
                    }
            }
        }
    }
}

