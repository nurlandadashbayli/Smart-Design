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

    var body: some View {

        Form { 
            Section {
                VStack {
                    VStack(alignment: .leading) {
                        Text("   Name:")
                        TextField("",text: $title)
                    }.padding()
                    VStack(alignment: .leading) {
                        Text("   Room Width:")
                        TextField("", text: $roomWidth, prompt: Text("\(design.roomWidth)"))
                    }.padding()
                    VStack(alignment: .leading) {
                        Text("   Room Depth:")
                        TextField("", text: $roomDepth, prompt: Text("\(design.roomDepth)"))
                    }.padding()
                    VStack(alignment: .leading) {
                        Text("   Screen Diagonal:")
                        TextField("", text: $screenDiagonal, prompt: Text("\(design.screenDiagonal)"))
                    }.padding()
                    VStack(alignment: .leading) {
                        Text("   Area:")
                        TextField("", text: $area, prompt: Text("\(design.area)"))
                    }.padding()
                    VStack(alignment: .leading) {
                        Text("   Number of people:")
                        TextField("", text: $people, prompt: Text("\(design.people)"))
                    }.padding()
                    
                    
                    
                    
                    // Insert the value of the screen diagonal from the database here for the selected design
                    .onAppear() {
                        title = design.title!
                        roomDepth = String(design.roomDepth)
                        roomWidth = String(design.roomWidth)
                        area = String(design.area)
                        screenDiagonal = String(design.screenDiagonal)
                        people = String(format: "%.0f", design.people)
                    }
                    // Update the values according to the next selected design
                    .onChange(of: design) { design in
                        title = design.title!
                        roomDepth = String(design.roomDepth)
                        roomWidth = String(design.roomWidth)
                        area = String(design.area)
                        screenDiagonal = String(design.screenDiagonal)
                        people = String(format: "%.0f", design.people)
                    }
                }
                .padding()

                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().editDesign(design: design, title: title, roomDepth: roomDepth, roomWidth: roomWidth, screenDiagonal: screenDiagonal, area: area, people: people, context: managedObjectContext)
                    }
                    .padding(.all)
                }
            }
        } // make the background transparent
        .background(Color.clear)
    }
}
