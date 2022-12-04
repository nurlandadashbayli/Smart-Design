//func addDesign(title: String, roomDepth: String, roomWidth: String, context: NSManagedObjectContext) {
//let design = Design(context: context)
//// var screenWidth = calculateScreenWidth()
//// var screenWall = design.roomWidth
//// var screenDiagonal = calculateScreenDiagonal()// inches
//
//design.id = UUID()
//design.date = Date()
//design.title = title
//design.roomDepth = Double(roomDepth)!
//design.roomWidth = Double(roomWidth)!
//design.area = calculateArea()//Double(roomWidth)! * Double(roomDepth)!
//design.screenDiagonal = calculateScreenDiagonal() //Double(screenDiagonal)!
//design.screenWidth = calculateScreenWidth() //(pow( (pow(design.screenDiagonal, 2) / (1 + pow((1/1.78),2))), 0.5)) // inches
////design.screenHeight = (pow( (pow(design.screenDiagonal, 2) / (1 + pow(1.78, 2))), 0.5)) // inches
//design.lvd = calculateLongestAllowableViewingDistance() //((screenWidth / 0.46173638224) * 2.54) / 100  // 2x(tan(13•)
//design.svd = calculateShortesRecommendedViewingDistance() //((screenWidth / 1.40041507642) * 2.54) / 100 // 2x(tan(35•)
//design.people = calculateNumberOfPeople() //floor((Double(roomWidth)!-2) * (calculateLongestAllowableViewingDistance() - calculateShortesRecommendedViewingDistance()))
//save(context: context)
//
///*
// *
// *
// *
// *
// *
// */
//// Calculation Functions
//
//
//// Calculate Area
//func calculateArea() -> Double {
//    let area = Double(roomWidth)! * Double(roomDepth)!
//    return area
//}
//
//// Calculate Screen Diagonal based on the chosen wall for the Screen
//func calculateScreenDiagonal() -> Double {
//    var RW = Double(roomWidth)!
//    var screenDiagonal: Double = 120
//    while RW < 3.657 {
//        screenDiagonal -= 5
//        RW += 0.111
//    }
//    return screenDiagonal
//}
//
//
//
//
//// Calculate the screen width based on the screen diagonal
//func calculateScreenWidth() -> Double {
//    let screenWidth = (pow( (pow(calculateScreenDiagonal(), 2) / (1 + pow((1/1.78),2))), 0.5)) // inches
//    return screenWidth
//}
//
//// Calculate the screen height based on the screen diagonal
//func calculateScreenHeight() -> Double {
//    let screenHeight = (pow( (pow(calculateScreenDiagonal(), 2) / (1 + pow(1.78, 2))), 0.5)) // inches
//    return screenHeight
//}
//
//// Calculate the Longest allowed viewing distance for THX certifications
//func calculateLongestAllowableViewingDistance() -> Double {
//    let longestAllowableViewingDistance = ((calculateScreenWidth() / 0.46173638224) * 2.54) / 100  // 2x(tan(13•)
//    return longestAllowableViewingDistance // returns in m
//}
//
////        // Calculate the Longest recommended viewing distance for THX certifications
////        func calculateLongestRecommendedViewingDistance() -> Double {
////            let longestRecommendedViewingDistance = ((screenWidth / 0.64983939246) * 2.54) / 100 // 2x(tan(18•)
////            return longestRecommendedViewingDistance // returns in m
////        }
//
//// Calculate the Shortest recommended viewing distance
//func calculateShortesRecommendedViewingDistance() -> Double {
//    let shortesRecommendedViewingDistance = ((calculateScreenWidth() / 1.40041507642) * 2.54) / 100 // 2x(tan(35•)
//    return shortesRecommendedViewingDistance // returns in m
//}
//
//// Calculate the number of listeners
//func calculateNumberOfPeople() -> Double {
//    let areaOfSeats = ((Double(roomWidth)!-2) * (calculateLongestAllowableViewingDistance() - calculateShortesRecommendedViewingDistance()))
//    let numberOfPeople = floor(areaOfSeats)
//    return Double(numberOfPeople)
//}
//
//
//
//
//
//
//
//}
