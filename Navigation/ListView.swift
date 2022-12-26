//
//  ListView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 28.11.22.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var design: FetchedResults<Design>
    
    @Binding var selectedDesign: Design?
    
    @State private var showingAddView = false
    
    var body: some View {
        List {
            ForEach(design) { design in
                Text(design.title!)
                    .bold()
                    .onTapGesture {
                        self.selectedDesign = design
                    }
            }
            .onDelete(perform: deleteDesign)
        }
        .listStyle(.sidebar)
        
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {showingAddView.toggle()}
            label: {Label("Add", systemImage: "plus.circle")}
                
            }
            
        }
        .sheet(isPresented: $showingAddView) {
            AddDesignView()
        }
    }
        
        func deleteDesign(offsets: IndexSet) {
            withAnimation {
                offsets.map { design[$0] }.forEach(managedObjectContext.delete)
                DataController().save(context: managedObjectContext)
            }
        }
}
