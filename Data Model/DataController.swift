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
    private let calc = Calculators()
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    // Function to save the data
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data saved")
        }
        catch {
            print("Saving failed")
        }
    }
    
    // Function to create a new design
    func addDesign(title: String, roomDepth: String, roomWidth: String, context: NSManagedObjectContext) {
        let design = Design(context: context)
        
        design.id = UUID() 
        design.date = Date() 
        design.title = title 
        design.roomDepth = Double(roomDepth)! 
        design.roomWidth = Double(roomWidth)! 
        design.screenWall = "Front"
        design.area = Double(calc.calculateArea(roomWidth: roomWidth, roomDepth: roomDepth))!
        design.screenDiagonal = Double(calc.calculateScreenDiagonal(roomWidth: roomWidth))!
        design.screenWidth = Double(calc.calculateScreenWidth(roomWidth: roomWidth))!
        design.lvd = calc.calculateLongestAllowableViewingDistance(roomWidth: roomWidth)
        design.svd = calc.calculateShortestRecommendedViewingDistance(roomWidth: roomWidth)
        design.people = Double(calc.calculateNumberOfPeople(roomWidth: roomWidth))!
        design.lamps = Double(calc.calculateLamps(roomWidth: roomWidth, roomDepth: roomDepth))!
        design.lampsPerWall = calc.lampsPerWall(roomWidth: roomWidth, roomDepth: roomDepth)
        design.lfe = true
        save(context: context) 
    }
    
    // Function to Edit the design and save the changes
    func editDesign(design: Design, title: String, roomDepth: String, roomWidth: String, screenDiagonal: String, area: String, people: String, lamps: String, lampsPerWall: String, screenWall: String, lfe: Bool, context: NSManagedObjectContext) {

        design.date = Date() 
        design.title = title
        design.roomDepth = Double(roomDepth)!
        design.roomWidth = Double(roomWidth)!
        design.screenWall = screenWall
        design.area = Double(calc.calculateArea(roomWidth: roomWidth, roomDepth: roomDepth))!
        design.screenDiagonal = Double(calc.calculateScreenDiagonal(roomWidth: roomWidth))!
        design.people = Double(calc.calculateNumberOfPeople(roomWidth: roomWidth))!
        design.lamps = Double(calc.calculateLamps(roomWidth: roomWidth, roomDepth: roomDepth))!
        design.lampsPerWall = calc.lampsPerWall(roomWidth: roomWidth, roomDepth: roomDepth)
        design.lfe = lfe
        save(context: context)
    }
}
