//
//  Smart_DesignApp.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 17.11.22.
//

import SwiftUI

@main
struct Smart_DesignApp: App {
    
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
