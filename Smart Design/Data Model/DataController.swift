//
//  DataController.swift
//  Smart Design
//
//  Created by Nurlan Dadashbayli on 17.11.22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "DesignModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data saved")
        }
        catch {
            print("Saving failed")
        }
    }
    
    func addDesign(title: String, area: Double, context: NSManagedObjectContext) {
        let design = Design(context: context)
        design.id = UUID()
        design.date = Date()
        design.title = title
        design.area = area
        
        save(context: context)
    }
    
    func editDesign(design: Design, title: String, area: Double, context: NSManagedObjectContext) {
        design.date = Date()
        design.title = title
        design.area = area
        
        save(context: context)
    }
}