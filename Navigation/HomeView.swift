//
//  ContentView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 17.11.22.
//

import SwiftUI

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var design: FetchedResults<Design>
    
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    @State private var selectedFromList: Design?
    
    @State private var selectedDesign: Design.ID?
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(design, selection: $selectedDesign) { design in
                Text(design.title!)
            }
            .onTapGesture {
                selectedFromList = design.first(where: { $0.id == selectedDesign })
            }
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
        content: {
            if let designId = selectedDesign {
                let selectedDesign = design.first(where: { $0.id == designId })
                EditDesignView(design: selectedDesign!)
            } else {
                Text("Select a design")
            }
        }
        detail: {
            if let designId = selectedDesign {
                let selectedDesign = design.first(where: { $0.id == designId })
                ThreeDView(design: selectedDesign!)
            } else {
                Text("Select a design")
            }
        }
        .onAppear() {
            columnVisibility = .all
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
