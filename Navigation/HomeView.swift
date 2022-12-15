//
//  ContentView.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 17.11.22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationSplitView {
            ListView()
                .frame(minWidth:40)
                .listStyle(.plain)
                .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
        content: {
            Text("Select a design")
                .frame(minWidth:60)
                .scrollContentBackground(.visible)
        }
        detail: {
            ThreeDView()
                .frame(minWidth:60)
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
