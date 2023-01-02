//
//  ContentView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 17.11.22.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var design: FetchedResults<Design>
    
    @State private var selectedDesign: Design.ID?
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @State private var showingAddView = false
    
    var body: some View {
           NavigationSplitView(columnVisibility: $columnVisibility) {
               List(design, selection: $selectedDesign) { design in
                   Text(design.title!)
               }
               
               .toolbar {
                   ToolbarItem(placement: .primaryAction) {
                       Button(action: { showingAddView.toggle() }, label: {
                           Label("Add", systemImage: "plus.circle")
                       })
                   }
               }
               .sheet(isPresented: $showingAddView) {
                   AddDesignView()
               }
           }
        
           content: {
               if let designId = selectedDesign {
                   let selectedDesign = design.first(where: { $0.id == designId })
                   if !design.isEmpty {
                       EditDesignView(design: selectedDesign ?? design[0])
                   } else {
                       Text("No designs to view")
                   }

               } else {
                   Text("Select a design")
               }
           }
        

           detail: {
               if let designId = selectedDesign {
                   let selectedDesign = design.first(where: { $0.id == designId })
                   if !design.isEmpty {
                       ThreeDView(design: selectedDesign ?? design[0])
                   } else {
                       Text("No designs to view")
                   }

               } else {
                   Text("Select a design")
               }

           }

           .toolbar {
               ToolbarItem(placement: .primaryAction) {
                   Button(action: deleteDesign, label: {
                       Label("Delete", systemImage: "trash")
                   })
                   .disabled(selectedDesign == nil)
               }
           }
    }
    
    func deleteDesign() {
        if let designId = selectedDesign {
            let selectedDesign = design.first(where: { $0.id == designId })
            managedObjectContext.delete(selectedDesign ?? design[0])
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
}
