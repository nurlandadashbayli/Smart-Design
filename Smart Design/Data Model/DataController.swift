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
    
    func addDesign(title: String, roomDepth: String, roomWidth: String, screenDiagonal: String, context: NSManagedObjectContext) {
        let design = Design(context: context)
        design.id = UUID()
        design.date = Date()
        design.title = title
        design.roomDepth = Double(roomDepth)!
        design.roomWidth = Double(roomWidth)!
        design.area = Double(roomWidth)! * Double(roomDepth)!  //roomWidth * roomDepth
        design.screenDiagonal = Double(screenDiagonal)!
        design.screenWidth = (pow( (pow(Double(screenDiagonal)!, 2) / (1 + pow((1/1.78),2))), 0.5)) // inches
        design.screenHeight = (pow( (pow(Double(screenDiagonal)!, 2) / (1 + pow(1.78, 2))), 0.5)) // inches
        design.lvd = ((screenWidth / 0.46173638224) * 2.54) / 100  // 2x(tan(13•)
        design.svd = ((screenWidth / 1.40041507642) * 2.54) / 100 // 2x(tan(35•)
        design.people = floor((Double(roomWidth)!-2) * (calculateLongestAllowableViewingDistance() - calculateShortesRecommendedViewingDistance()))
        save(context: context)
    }
    
//    func editDesign(design: Design, title: String, roomDepth: Double, roomWidth: Double, area: Double, people: Double, context: NSManagedObjectContext) {
//        design.date = Date()
//        design.title = title
//        design.roomDepth = roomDepth
//        design.roomWidth = roomWidth
//        design.area = roomWidth * roomDepth
//        
//        save(context: context)
//    }
    
}
