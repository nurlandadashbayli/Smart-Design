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
    var body: some View {
        
        Form {
            Section {
                TextField("\(design.title!)", text: $title)
                // to show the current values
                    .onAppear {
                        title = design.title!
                        area = design.area
                    }
                VStack {
                    Text("Area: \(Int(area))")
                    Slider(value: $area, in: 0...1000)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().editDesign(design: design, title: title, area: area, context: managedObjectContext)
                       // dismiss()
                    }
                    .padding(.all)
                }
            }
        }
    }
}
