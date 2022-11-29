//
//  TableView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 28.11.22.
//

import SwiftUI

struct TableView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @Environment (\.dismiss) var dismiss
    

    var body: some View {
        Text("Hello")
        }
    }

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
