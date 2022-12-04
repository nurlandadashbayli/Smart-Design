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
    
    func addDesign(title: String, roomDepth: String, roomWidth: String, context: NSManagedObjectContext) {
        let design = Design(context: context)
        // var screenWidth = calculateScreenWidth()
        // var screenWall = design.roomWidth
        // var screenDiagonal = calculateScreenDiagonal()// inches
        
        design.id = UUID()
        design.date = Date()
        design.title = title
        design.roomDepth = Double(roomDepth)!
        design.roomWidth = Double(roomWidth)!
        design.screenWall = screenPosition()
        design.area = calculateArea()
        //Double(roomWidth)! * Double(roomDepth)!
        design.screenDiagonal = calculateScreenDiagonal()
        //Double(screenDiagonal)!
        design.screenWidth = calculateScreenWidth()
        //(pow( (pow(design.screenDiagonal, 2) / (1 + pow((1/1.78),2))), 0.5)) // inches

        design.lvd = calculateLongestAllowableViewingDistance() //((screenWidth / 0.46173638224) * 2.54) / 100  // 2x(tan(13•)
        design.svd = calculateShortesRecommendedViewingDistance() //((screenWidth / 1.40041507642) * 2.54) / 100 // 2x(tan(35•)
        design.people = calculateNumberOfPeople() //floor((Double(roomWidth)!-2) * (calculateLongestAllowableViewingDistance() - calculateShortesRecommendedViewingDistance()))
        save(context: context)
        
// CALCULATION FUNCTIONS
        
        //Screen Wall
        func screenPosition() -> String {
            let SP = "Front"
            return SP
        }
        
        // Calculate Area
        func calculateArea() -> Double {
            let area = Double(roomWidth)! * Double(roomDepth)!
            return area
        }

        // Calculate Screen Diagonal based on the chosen wall for the Screen
        func calculateScreenDiagonal() -> Double {
            var RW = Double(roomWidth)!
            var screenDiagonal: Double = 120
            while RW < 3.657 {
                screenDiagonal -= 5
                RW += 0.111
            }
            return screenDiagonal
        }

        // Calculate the screen width based on the screen diagonal
        func calculateScreenWidth() -> Double {
            let screenWidth = (pow( (pow(calculateScreenDiagonal(), 2) / (1 + pow((1/1.78),2))), 0.5)) // inches
            return screenWidth
        }

        // Calculate the screen height based on the screen diagonal
        func calculateScreenHeight() -> Double {
            let screenHeight = (pow( (pow(calculateScreenDiagonal(), 2) / (1 + pow(1.78, 2))), 0.5)) // inches
            return screenHeight
        }

        // Calculate the Longest allowed viewing distance for THX certifications
        func calculateLongestAllowableViewingDistance() -> Double {
            let longestAllowableViewingDistance = ((calculateScreenWidth() / 0.46173638224) * 2.54) / 100  // 2x(tan(13•)
            return longestAllowableViewingDistance // returns in m
        }

        // Calculate the Shortest recommended viewing distance
        func calculateShortesRecommendedViewingDistance() -> Double {
            let shortesRecommendedViewingDistance = ((calculateScreenWidth() / 1.40041507642) * 2.54) / 100 // 2x(tan(35•)
            return shortesRecommendedViewingDistance // returns in m
        }

        // Calculate the number of listeners
        func calculateNumberOfPeople() -> Double {
            let areaOfSeats = ((Double(roomWidth)!-2) * (calculateLongestAllowableViewingDistance() - calculateShortesRecommendedViewingDistance()))
            let numberOfPeople = floor(areaOfSeats)
            return Double(numberOfPeople)
        }
    }
    
    func editDesign(design: Design, title: String, roomDepth: String, roomWidth: String, screenDiagonal: String, area: String, people: String, screenWall: String, context: NSManagedObjectContext) {

        design.date = Date()
        design.title = title
        design.roomDepth = Double(roomDepth)!
        design.roomWidth = Double(roomWidth)!
        design.screenWall = screenWall
        design.area = calculateArea()
        design.screenDiagonal = calculateScreenDiagonal()
        design.people = calculateNumberOfPeople()
        save(context: context)

// CALCULATION FUNCTIONS
        
        //Screen Wall
        func screenPosition() -> String {
            let SP = "Front"
            return SP
        }
            
        // Calculate Area
        func calculateArea() -> Double {
            let area = Double(roomWidth)! * Double(roomDepth)!
            return area
        }

        // Calculate Screen Diagonal based on the chosen wall for the Screen
        func calculateScreenDiagonal() -> Double {
            var RW = Double(roomWidth)!
            var screenDiagonal: Double = 120
            while RW < 3.657 {
                screenDiagonal -= 5
                RW += 0.111
            }
            return screenDiagonal
        }

        // Calculate the screen width based on the screen diagonal
        func calculateScreenWidth() -> Double {
            let screenWidth = (pow( (pow(calculateScreenDiagonal(), 2) / (1 + pow((1/1.78),2))), 0.5)) // inches
            return screenWidth
        }

        // Calculate the screen height based on the screen diagonal
        func calculateScreenHeight() -> Double {
            let screenHeight = (pow( (pow(calculateScreenDiagonal(), 2) / (1 + pow(1.78, 2))), 0.5)) // inches
            return screenHeight
        }

        // Calculate the Longest allowed viewing distance for THX certifications
        func calculateLongestAllowableViewingDistance() -> Double {
            let longestAllowableViewingDistance = ((calculateScreenWidth() / 0.46173638224) * 2.54) / 100  // 2x(tan(13•)
            return longestAllowableViewingDistance // returns in m
        }

        // Calculate the Shortest recommended viewing distance
        func calculateShortesRecommendedViewingDistance() -> Double {
            let shortesRecommendedViewingDistance = ((calculateScreenWidth() / 1.40041507642) * 2.54) / 100 // 2x(tan(35•)
            return shortesRecommendedViewingDistance // returns in m
        }

        // Calculate the number of listeners
        func calculateNumberOfPeople() -> Double {
            let areaOfSeats = ((Double(roomWidth)!-2) * (calculateLongestAllowableViewingDistance() - calculateShortesRecommendedViewingDistance()))
            let numberOfPeople = floor(areaOfSeats)
            return Double(numberOfPeople)
        }
    }
    
    func Calculations (roomWidth: String, roomDepth: String) {

        //Screen Wall
        func screenPosition() -> String {
            let SP = "Front"
            return SP
        }
        
            
        // Calculate Area
        func calculateArea() -> Double {
            let area = Double(roomWidth)! * Double(roomDepth)!
            return area
        }

        // Calculate Screen Diagonal based on the chosen wall for the Screen
        func calculateScreenDiagonal() -> Double {
            var RW = Double(roomWidth)!
            var screenDiagonal: Double = 120
            while RW < 3.657 {
                screenDiagonal -= 5
                RW += 0.111
            }
            return screenDiagonal
        }

        // Calculate the screen width based on the screen diagonal
        func calculateScreenWidth() -> Double {
            let screenWidth = (pow( (pow(calculateScreenDiagonal(), 2) / (1 + pow((1/1.78),2))), 0.5)) // inches
            return screenWidth
        }

        // Calculate the screen height based on the screen diagonal
        func calculateScreenHeight() -> Double {
            let screenHeight = (pow( (pow(calculateScreenDiagonal(), 2) / (1 + pow(1.78, 2))), 0.5)) // inches
            return screenHeight
        }

        // Calculate the Longest allowed viewing distance for THX certifications
        func calculateLongestAllowableViewingDistance() -> Double {
            let longestAllowableViewingDistance = ((calculateScreenWidth() / 0.46173638224) * 2.54) / 100  // 2x(tan(13•)
            return longestAllowableViewingDistance // returns in m
        }

        // Calculate the Shortest recommended viewing distance
        func calculateShortesRecommendedViewingDistance() -> Double {
            let shortesRecommendedViewingDistance = ((calculateScreenWidth() / 1.40041507642) * 2.54) / 100 // 2x(tan(35•)
            return shortesRecommendedViewingDistance // returns in m
        }

        // Calculate the number of listeners
        func calculateNumberOfPeople() -> Double {
            let areaOfSeats = ((Double(roomWidth)!-2) * (calculateLongestAllowableViewingDistance() - calculateShortesRecommendedViewingDistance()))
            let numberOfPeople = floor(areaOfSeats)
            return Double(numberOfPeople)
        }
    }
    
}
