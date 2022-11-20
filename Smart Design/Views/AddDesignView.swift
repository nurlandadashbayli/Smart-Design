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
    @State private var area: Double = 0
    @State private var people: Double = 0
    @State private var roomWidth: Double = 0
    @State private var roomDepth: Double = 0
    
    var body: some View {
        Form {
            Section {
                TextField("Design title", text: $title)
                
                VStack {
                    Text("Room Depth: \(Int(roomDepth))")
                    Slider(value: $roomDepth, in: 0...1000)
                    
                   Text("Room Width: \(Int(roomWidth))")
                    Slider(value: $roomWidth, in: 0...1000)
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
                                area: area,
                                people: people,
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
