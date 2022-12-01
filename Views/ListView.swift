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

    @State private var showingAddView = false
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                ForEach(design) { design in
                    NavigationLink(destination: EditDesignView(design: design)) //EditDesignView(design: design))
                    {
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(design.title!)
                                    .bold()
                            }
                        }
                    }
                }
                .onDelete(perform: deleteDesign)
            }
            
        }
        .toolbar {
            ToolbarItem {
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
