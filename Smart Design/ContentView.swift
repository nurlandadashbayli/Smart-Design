//
//  ContentView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 17.11.22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var design: FetchedResults<Design>
    
    @State private var showingAddView = false
    @State private var showingEditView = false
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(design) { design in
                        NavigationLink(destination: Text("editdesignview")) //EditDesignView(design: design))
                        {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(design.title!)
                                        .bold()
                                    Text("\(Int(design.screenDiagonal))") +
                                    Text (" inches")
                                    
                                    Text("\(Int(design.people))") +
                                    Text (" people")
                                    
                                    Text("\(Int(design.roomWidth))") +
                                    Text (" m")
                                    
                                    Text("\(Int(design.roomDepth))") +
                                    Text (" m")
                                    
                                    Text("\(Double(design.area))") +
                                    Text (" m2")
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteDesign)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Smart Design")
            .toolbar {
                ToolbarItem {
                    Button {
                        showingAddView.toggle()
                    }
                label: {
                    Label("Add", systemImage: "plus.circle")
                }
            }
        }
            .sheet(isPresented: $showingAddView) {
                AddDesignView()
            }
        }
    }
        
    func deleteDesign(offsets: IndexSet) {
        withAnimation {
            offsets.map { design[$0] }.forEach(managedObjectContext.delete)
            DataController().save(context: managedObjectContext)
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
