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
                    
                   // Text("Room Width: \(String(roomWidth))")
                    TextField("Room Width:", text: $roomWidth)
                    
                    //Slider(value: $roomWidth, in: 0...100)
                    TextField("Room Depth:", text: $roomDepth)
                   // Text("Room Depth: \(String(roomDepth))")
                    
                    
                    TextField("Screen Diagonal:", text: $screenDiagonal)
                    //Slider(value: $roomDepth, in: 0...100)
                    
                    //Text("Screen Diagonal: \(Double(screenDiagonal))")
                    //Slider(value: $screenDiagonal, in: 0...500)
                    
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController()
                            .addDesign(
                                title: title,
                                roomDepth: roomDepth,
                                roomWidth: roomWidth,
                                screenDiagonal: screenDiagonal,
                                context: managedObjectContext)
                            dismiss()
                    }
                    .padding(.all)
                }
            }
        }.padding(.all)
    }
}

struct AddDesignView_Previews: PreviewProvider {
    static var previews: some View {
        AddDesignView()
    }
}
