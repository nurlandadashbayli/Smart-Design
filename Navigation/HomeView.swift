//
//  ContentView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 17.11.22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            ListView()
                .frame(minWidth:80)
                .listStyle(.plain)
        }
        content: {
            Text("Select a design")
                .frame(minWidth:60)
        }
        detail: {
            ThreeDView()
                .frame(minWidth:60)
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
