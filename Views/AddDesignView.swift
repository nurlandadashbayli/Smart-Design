//
//  AddDesignView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 17.11.22.
//

import SwiftUI

struct AddDesignView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @Environment (\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var roomWidth: String = ""
    @State private var roomDepth: String = ""
    @State private var screenDiagonal: String = ""
    var body: some View {
        Form {
            Section {
                TextField("Design title:", text: $title)
                
                VStack {
                    
                    TextField("Room Width:", text: $roomWidth)

                    TextField("Room Depth:", text: $roomDepth)
       
                    TextField("Screen Diagonal:", text: $screenDiagonal)
                    
                    //Text("Screen Diagonal: \(Double(screenDiagonal))")
                    //Slider(value: $screenDiagonal, in: 0...500)
                    
                }
                .padding()
                
                HStack {
                    Button("Cancel") { dismiss() }
                    Spacer()
                    Button("Add") {
                        DataController()
                            .addDesign(
                                title: title,
                                roomDepth: roomDepth,
                                roomWidth: roomWidth,
                                screenDiagonal: screenDiagonal,
                                context: managedObjectContext)
                            dismiss()
                    }
                    .disabled(roomWidth.isEmpty)
                    .disabled(roomDepth.isEmpty)
                    .padding(.all)
                }
            }
        }
        .padding(.all)
        .frame(width: 600, height: 400)
    }
}

struct AddDesignView_Previews: PreviewProvider {
    static var previews: some View {
        AddDesignView()
    }
}
