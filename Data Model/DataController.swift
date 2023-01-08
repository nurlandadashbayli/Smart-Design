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
        design.aspectRatio = "16:9"
        design.area = Double(calc.calculateArea(roomWidth: roomWidth, roomDepth: roomDepth))!
        design.screenDiagonal = Double(calc.calculateScreenDiagonal(roomWidth: roomWidth))!
        design.screenWidth = Double(calc.calculateScreenWidth(roomWidth: roomWidth))!
        design.screenHeight = Double(calc.calculateScreenHeight(roomWidth: roomWidth))!
        design.lvd = calc.calculateLongestAllowableViewingDistance(roomWidth: roomWidth)
        design.svd = calc.calculateShortestRecommendedViewingDistance(roomWidth: roomWidth)
        design.people = Double(calc.calculateNumberOfPeople(roomWidth: roomWidth))!
        design.lamps = Double(calc.calculateLamps(roomWidth: roomWidth, roomDepth: roomDepth))!
        design.lampsPerWall = calc.lampsPerWall(roomWidth: roomWidth, roomDepth: roomDepth)
        design.speakers = "7"
        design.speakerFront = "3"
        design.speakerSides = "2"
        design.speakerBack = "2"
        design.lfe = true
        save(context: context) 
    }
    
    // Function to Edit the design and save the changes
    func editDesign(design: Design, title: String, roomDepth: String, roomWidth: String, screenDiagonal: String, screenWidth: String, screenHeight: String, area: String, people: String, lamps: String, lampsPerWall: String, screenWall: String, aspectRatio: String, speakers: String, frontSpeakers: String, sideSpeakers: String, lfe: Bool, context: NSManagedObjectContext) {

        design.date = Date() 
        design.title = title
        design.roomDepth = Double(roomDepth)!
        design.roomWidth = Double(roomWidth)!
        design.screenWall = screenWall
        design.aspectRatio = aspectRatio
        design.area = Double(calc.calculateArea(roomWidth: roomWidth, roomDepth: roomDepth))!
        design.screenDiagonal = Double(calc.calculateScreenDiagonal(roomWidth: roomWidth))!
        design.screenWidth = Double(calc.calculateScreenWidth(roomWidth: roomWidth))!
        design.screenHeight = Double(calc.calculateScreenHeight(roomWidth: roomWidth))!
        design.people = Double(calc.calculateNumberOfPeople(roomWidth: roomWidth))!
        design.lamps = Double(calc.calculateLamps(roomWidth: roomWidth, roomDepth: roomDepth))!
        design.lampsPerWall = calc.lampsPerWall(roomWidth: roomWidth, roomDepth: roomDepth)
        design.speakers = speakers

        if let speakersInt = Int(speakers) {
            // Front
            switch speakersInt {
            case 1:
                design.speakerFront = "1"
            case 2:
                design.speakerFront = "2"
            case 3:
                design.speakerFront = "3"
            case 4:
                design.speakerFront = "2"
            default:
                design.speakerFront = "3"
            }

            // Back
            switch speakersInt {
            case 1...5:
                design.speakerBack = "0"
            case 6:
                design.speakerBack = "1"
            case 7...8:
                design.speakerBack = "2"
            case 9:
                design.speakerBack = "3"
            case 10...Int.max:
                design.speakerBack = "value is incorrect"
            default:
                break
            }

            // Sides
            switch speakersInt {
            case 0...3:
                design.speakerSides = "0"
            case 4...7:
                design.speakerSides = "2"
            case 8...9:
                design.speakerSides = "4"
            case 10...Int.max:
                design.speakerSides = "value is too big"
            default:
                break
            }
        }


        design.lfe = lfe
    
        save(context: context)
    }
}
