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
                .frame(minWidth:20)
                .listStyle(.plain)
        }
        content: {
            Text("Select a design")
        }
        detail: {
            ThreeDView()
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
