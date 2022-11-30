import Foundation


var roomWidth: Double = 6
var roomDepth: Double = 8
var screenWidth = calculateScreenWidth()
var screenWall = roomWidth
var screenDiagonal = calculateScreenDiagonal()// inches


func youcalculateArea() -> Double {
    let area = roomWidth*roomDepth
    return area
}

// Calculate Screen Diagonal based on the chosen wall for the Screen
func calculateScreenDiagonal() -> Double {
    var screenDiagonal: Double = 120
    while screenWall < 3.657 {
        screenDiagonal -= 5
        screenWall += 0.111
    }
    return screenDiagonal
}




// Calculate the screen width based on the screen diagonal
func calculateScreenWidth() -> Double {
    let screenWidth = (pow( (pow(screenDiagonal, 2) / (1 + pow((1/1.78),2))), 0.5)) // inches
    return screenWidth
}

// Calculate the screen height based on the screen diagonal
func calculateScreenHeight() -> Double {
    let screenHeight = (pow( (pow(screenDiagonal, 2) / (1 + pow(1.78, 2))), 0.5)) // inches
    return screenHeight
}

// Calculate the Longest allowed viewing distance for THX certifications
func calculateLongestAllowableViewingDistance() -> Double {
    let longestAllowableViewingDistance = ((screenWidth / 0.46173638224) * 2.54) / 100  // 2x(tan(13•)
    return longestAllowableViewingDistance // returns in m
}

// Calculate the Longest recommended viewing distance for THX certifications
func calculateLongestRecommendedViewingDistance() -> Double {
    let longestRecommendedViewingDistance = ((screenWidth / 0.64983939246) * 2.54) / 100 // 2x(tan(18•)
    return longestRecommendedViewingDistance // returns in m
}

// Calculate the Shortest recommended viewing distance
func calculateShortesRecommendedViewingDistance() -> Double {
    let shortesRecommendedViewingDistance = ((screenWidth / 1.40041507642) * 2.54) / 100 // 2x(tan(35•)
    return shortesRecommendedViewingDistance // returns in m
}

// Calculate the number of listeners
func calculateNumberOfPeople() -> Int {
    let areaOfSeats = (roomWidth-2) * (calculateLongestAllowableViewingDistance() - calculateShortesRecommendedViewingDistance())
    let numberOfPeople = floor(areaOfSeats)
    return Int(numberOfPeople)
}
