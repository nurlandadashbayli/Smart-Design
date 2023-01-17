/**
 DataController class is responsible for handling the creation, editing and saving of "Design" objects
 */
import Foundation
import CoreData
class DataController: ObservableObject {
    // NSPersistentContainer with the name "DesignModel"
    /**
    NSPersistentContainer is used to manage the Core Data stack.
    */
    let container = NSPersistentContainer(name: "DesignModel")
    // A private property of type "Calculators" which contains methods for calculating various properties of a design
    /**
    A private property of type "Calculators" which contains methods for calculating various properties of a design.
    */
    private let calc = Calculators()
    // Initializer function that creates a NSPersistentContainer and loads the data store
    /**
    Initializer function that creates a NSPersistentContainer and loads the data store.
    - Throws: Error if loading of data store fails
    */
    init() {
        
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    /**
      Save the context and handle errors
      - Parameters:
        - context: The NSManagedObjectContext that needs to be saved
      - Throws: Error if the saving of context fails
    */
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data saved")
        }
        catch {
            print("Saving failed")
        }
    }
    /**
        Add a new design to the data store
        - Parameters:
            - title: Title of the design
            - roomDepth: Room depth of the design
            - roomWidth: Room width of the design
            - context: NSManagedObjectContext that the design will be added to
    */
    func addDesign(title: String, roomDepth: String, roomWidth: String, context: NSManagedObjectContext) {
        // Create a new Design object
        let design = Design(context: context)
        // Set the properties of the design
        design.id = UUID()
        design.date = Date()
        design.title = title
        design.roomDepth = Double(roomDepth)!
        design.roomWidth = Double(roomWidth)!
        design.roomHeight = 3
        design.screenWall = "Front"
        design.aspectRatio = "16:9"
        // Use the calc object to calculate various properties of the design
        design.minThrowDistance = Double(calc.calculateThrowDistance(roomWidth: roomWidth))!
        design.maxThrowDistance = Double(calc.calculateMaxThrowDistance(roomWidth: roomWidth))!
        design.area = Double(calc.calculateArea(roomWidth: roomWidth, roomDepth: roomDepth))!
        design.screenDiagonal = Double(calc.calculateScreenDiagonal(roomWidth: roomWidth))!
        design.screenWidth = Double(calc.calculateScreenWidth(roomWidth: roomWidth))!
        design.screenHeight = Double(calc.calculateScreenHeight(roomWidth: roomWidth))!
        design.lvd = calc.calculateLongestAllowableViewingDistance(roomWidth: roomWidth)
        design.svd = calc.calculateShortestRecommendedViewingDistance(roomWidth: roomWidth)
        design.people = Double(calc.calculateNumberOfPeople(roomWidth: roomWidth))!
        design.lamps = Double(calc.calculateTotalLamps(roomWidth: roomWidth, roomDepth: roomDepth))!
        design.lampsWidth = calc.calculateWidthLamps(roomWidth: roomWidth)
        design.lampsDepth = calc.calculateDepthLamps(roomDepth: roomDepth)
        design.speakers = "9"
        design.speakerFront = "3"
        design.speakerSides = "4"
        design.speakerBack = "2"
        design.lfe = true
        // Save the context
        save(context: context)
    }
    /**
        Edit an existing design in the data store
        - Parameters:
            - design: The design object that needs to be edited
            - title: Title of the design
            - roomDepth: Room depth of the design
            - roomWidth: Room width of the design
            - roomHeight: Room height of the design
            - screenDiagonal: Screen diagonal of the design
            - screenWidth: Screen width of the design
            - screenHeight: Screen height of the design
            - area: Area of the design
            - people: Number of people of the design
            - lamps: Number of lamps of the design
            - lampsWidth: Lamps width of the design
            - lampsDepth: Lamps depth of the design
            - screenWall: Screen wall of the design
            - aspectRatio: Aspect ratio of the design
            - speakers: Number of speakers of the design
            - speakerFront: Number of front speakers of the design
            - speakerBack: Number of back speakers of the design
            - speakerSides: Number of side speakers of the design
            - lfe: lfe of the design
            - context: NSManagedObjectContext that the design will be added to
    */
    func editDesign(design: Design, title: String, roomDepth: String, roomWidth: String, roomHeight: String, screenDiagonal: String, screenWidth: String, screenHeight: String, area: String, people: String, lamps: String, lampsWidth: String, lampsDepth: String, screenWall: String, aspectRatio: String, speakers: String, speakerFront: String, speakerBack: String, speakerSides: String, lfe: Bool, context: NSManagedObjectContext) {
        // Update the properties of the design object
        design.date = Date() 
        design.title = title
        design.roomDepth = Double(roomDepth)!
        design.roomWidth = Double(roomWidth)!
        design.roomHeight = Double(roomHeight)!
        design.screenWall = screenWall
        design.aspectRatio = aspectRatio
        design.minThrowDistance = Double(calc.calculateThrowDistance(roomWidth: roomWidth))!
        design.maxThrowDistance = Double(calc.calculateMaxThrowDistance(roomWidth: roomWidth))!
        design.area = Double(calc.calculateArea(roomWidth: roomWidth, roomDepth: roomDepth))!
        design.screenDiagonal = Double(calc.calculateScreenDiagonal(roomWidth: roomWidth))!
        design.screenWidth = Double(calc.calculateScreenWidth(roomWidth: roomWidth))!
        design.screenHeight = Double(calc.calculateScreenHeight(roomWidth: roomWidth))!
        design.people = Double(calc.calculateNumberOfPeople(roomWidth: roomWidth))!
        design.lamps = Double(calc.calculateTotalLamps(roomWidth: roomWidth, roomDepth: roomDepth))!
        design.lampsWidth = calc.calculateWidthLamps(roomWidth: roomWidth)
        design.lampsDepth = calc.calculateDepthLamps(roomDepth: roomDepth)
        design.speakers = speakers
        // check for number of speakers and update the value of front, back and side speakers accordingly
        if let speakersInt = Int(speakers) {
            // Front
            switch speakersInt {
            case 0: design.speakerFront = "No speaker"
            case 1: design.speakerFront = "1"
            case 2: design.speakerFront = "2"
            case 3: design.speakerFront = "3"
            case 4: design.speakerFront = "2"
            case 5...10: design.speakerFront = "3"
            case 11...Int.max: design.speakerFront = "value is incorrect"
            default: break
            }
            // Back
            switch speakersInt {
            case 0: design.speakerBack = "No speaker"
            case 1...5: design.speakerBack = "0"
            case 6: design.speakerBack = "1"
            case 7: design.speakerBack = "2"
            case 8: design.speakerBack = "1"
            case 9: design.speakerBack = "2"
            case 10: design.speakerBack = "3"
            case 11...Int.max: design.speakerBack = "Value is incorrect"
            default: break
            }
            // Sides
            switch speakersInt {
            case 0: design.speakerSides = "No speaker"
            case 1...3: design.speakerSides = "0"
            case 4...7: design.speakerSides = "2"
            case 8...10: design.speakerSides = "4"
            case 11...Int.max: design.speakerSides = "Value is incorrect"
            default: break
            }
        }
        design.lfe = lfe
        save(context: context)
    }
}
