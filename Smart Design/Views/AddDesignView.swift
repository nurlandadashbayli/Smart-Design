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
    
    var body: some View {
        Form {
            Section {
                TextField("Design title", text: $title)
                
                VStack {
                    Text("Area: \(Int(area))")
                    Slider(value: $area, in: 0...1000)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().addDesign(title: title, area: area, context: managedObjectContext)
                            dismiss()
                    }
                    .padding(.all)
                }
            }
        }
    }
}

struct AddDesignView_Previews: PreviewProvider {
    static var previews: some View {
        AddDesignView()
    }
}
