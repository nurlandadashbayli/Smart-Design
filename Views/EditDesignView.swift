//
//  EditDesignView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 18.11.22.
//

import SwiftUI

struct EditDesignView: View {

    @Environment (\.managedObjectContext) var managedObjectContext
    @Environment (\.dismiss) var dismiss

    var design: FetchedResults<Design>.Element

    @State private var title = ""
    @State private var area: Double = 0
    @State private var people: Double = 0
    @State private var roomWidth: String = ""
    @State private var roomDepth: String = ""
    @State private var screenDiagonal: String = ""

    var body: some View {

        Form { 
            Section {
                VStack {
                    
                    TextField("Name:", text: $title)
                    
                    TextField("Room Width:", text: $roomWidth, prompt: Text("\(design.roomWidth)"))

                    TextField("Room Depth:", text: $roomDepth, prompt: Text("\(design.roomDepth)"))

                    TextField("Screen Diagonal:", text: $screenDiagonal, prompt: Text("\(design.screenDiagonal)"))
                    
                    // Insert the value of the screen diagonal from the database here for the selected design
                    .onAppear() {
                        title = design.title!
                        roomDepth = String(design.roomDepth)
                        roomWidth = String(design.roomWidth)
                        screenDiagonal = String(design.screenDiagonal)
                    }

                    // Update the values according to the next selected design
                    .onChange(of: design) { design in
                        title = design.title!
                        roomDepth = String(design.roomDepth)
                        roomWidth = String(design.roomWidth)
                        screenDiagonal = String(design.screenDiagonal)
                    }


                 


                    
                    
                }
                
                .padding()

                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().editDesign(design: design,
                                                    title: title,
                                                    roomDepth: roomDepth,
                                                    roomWidth: roomWidth,
                                                    screenDiagonal: screenDiagonal,
                                                    area: area,
                                                    people: people,
                                                    context: managedObjectContext)
                                                dismiss()
                    }
                    .padding(.all)
                }
            }
        }
    }
}
