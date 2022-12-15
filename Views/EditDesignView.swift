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
            Form{
                VStack {
                    VStack(alignment: .leading) {
                        Text("   Name:")
                            .fontWeight(.bold)
                        TextField("",text: $title)
                    }.padding(.bottom, 10.0)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("   Room Width:")
                                .fontWeight(.bold)
                            TextField("", text: $roomWidth, prompt: Text("\(design.roomWidth)"))
                        }.padding(.bottom, 10.0)
                        VStack(alignment: .leading) {
                            Text("   Room Depth:")
                                .fontWeight(.bold)
                            TextField("", text: $roomDepth, prompt: Text("\(design.roomDepth)"))
                        }.padding(.bottom, 10.0)
                    }
                    VStack(alignment: .leading) {
                        Text("   Screen Diagonal:")
                            .fontWeight(.bold)
                        TextField("", text: $screenDiagonal, prompt: Text("\(design.screenDiagonal)"))
                    }.padding(.bottom, 10.0)
                    VStack(alignment: .leading) {
                        Text("   Screen position:")
                            .fontWeight(.bold)
                        Picker(selection: $screenWall, label: Text("")) {
                            Text("Front").tag("Front")
                            Text("Back").tag("Back")
                            Text("Left").tag("Left")
                            Text("Right").tag("Right")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }.padding(.bottom, 10.0)
                    
                    VStack(alignment: .leading) {
                        Text("   Area:")
                            .fontWeight(.bold)
                        TextField("", text: $area, prompt: Text("\(design.area)"))
                    }.padding(.bottom, 10.0)
                    VStack(alignment: .leading) {
                        Text("   Number of people:")
                            .fontWeight(.bold)
                        TextField("", text: $people, prompt: Text("\(design.people)"))
                    }.padding(.bottom, 10.0)
                    VStack(alignment: .leading) {
                        Text("   Number of lamps:")
                            .fontWeight(.bold)
                        TextField("", text: $lamps, prompt: Text("\(design.lamps)"))
                    }.padding(.bottom, 10.0)
                    
                    
                    
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
                .padding()
                
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
            }
        } // make the background transparent
        .background(Color.clear)
    }
}
