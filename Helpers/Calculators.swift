import Foundation

// CALCULATION FUNCTIONS

class Calculators {
    
    // Calculate Area
    func calculateArea(roomWidth: String, roomDepth: String) -> String {
        let rw = Double(roomWidth) ?? 0
        let rd = Double(roomDepth) ?? 0
        
        if rw <= 0 || rd <= 0 {
            return "Enter a positive value"
        }
        if rw > 1000 || rd > 1000 {
            return "Value is too large"
        }
        if rw < 1 || rd < 1 {
            return "Value is too small"
        }
        return String(Double(roomWidth)! * Double(roomDepth)!)
    }
    

    // Calculate Screen Diagonal based on the chosen wall for the Screen
    func calculateScreenDiagonal(roomWidth: String) -> String {
        var rw = Double(roomWidth) ?? 0
        var screenDiagonal: Double = 120
        if rw <= 0 {
            return "Enter a positive value"
        }
        if rw > 1000 {
            return "Value is too large"
        }
        if rw < 1 {
            return "Value is too small"
        }
        else {
            while rw < 3.657 {
                screenDiagonal -= 5
                rw += 0.111
            }
        }
        return String(screenDiagonal)
    }
    
    
    // Calculate the screen width based on the screen diagonal
    func calculateScreenWidth(roomWidth: String) -> String {
        let screenDiagonal = Double(calculateScreenDiagonal(roomWidth: roomWidth)) ?? 0
        let rw = Double(roomWidth) ?? 0
        
        if rw <= 0 {
            return "Enter a positive value"
        }
        if rw > 1000 {
            return "Value is too large"
        }
        if rw < 1 {
            return "Value is too small"
        }
        return String((pow( (pow(Double(screenDiagonal), 2) / (1 + pow((1/1.78),2))), 0.5))) // inches)
    }

    // Calculate the screen height based on the screen diagonal in inches
    func calculateScreenHeight(roomWidth: String) -> String {
        let screenDiagonal = Double(calculateScreenDiagonal(roomWidth: roomWidth)) ?? 0
        let rw = Double(roomWidth) ?? 0
        if rw <= 0 {
            return "Enter a positive value"
        }
        if rw > 1000 {
            return "Value is too large"
        }
        if rw < 1 {
            return "Value is too small"
        }
        return String((pow((pow(screenDiagonal, 2) / (1 + pow(1.78, 2))), 0.5)))
    }

    // Calculate the Longest allowed viewing distance for THX certifications
    func calculateLongestAllowableViewingDistance(roomWidth: String) -> Double {
        let screenWidth = Double(calculateScreenWidth(roomWidth: roomWidth)) ?? 0
        let longestAllowableViewingDistance = ((screenWidth / 0.46173638224) * 2.54) / 100  // 2x(tan(13•)
        return longestAllowableViewingDistance // returns in m
    }

    // Calculate the Shortest recommended viewing distance
    func calculateShortesRecommendedViewingDistance(roomWidth: String) -> Double {
        let screenWidth = Double(calculateScreenWidth(roomWidth: roomWidth)) ?? 0
        let shortesRecommendedViewingDistance = ((screenWidth / 1.40041507642) * 2.54) / 100 // 2x(tan(35•)
        return shortesRecommendedViewingDistance // returns in m
    }

    // Calculate the number of listeners
    func calculateNumberOfPeople(roomWidth: String) -> String {
        let rw = Double(roomWidth) ?? 0
        let lvd = calculateLongestAllowableViewingDistance(roomWidth: roomWidth)
        let svd = calculateShortesRecommendedViewingDistance(roomWidth: roomWidth)
        let areaOfSeats = ((rw-2) * (lvd - svd))
        let numberOfPeople = floor(areaOfSeats)
        
        if rw <= 0 {
            return "Enter a positive value"
        }
        if rw > 1000 {
            return "Value is too large"
        }
        if rw < 1 {
            return "Value is too small"
        }
        
        return String(numberOfPeople)
    }

    func calculateLamps(roomWidth: String, roomDepth: String) -> String {
        let rw = Double(roomWidth) ?? 0
        let rd = Double(roomDepth) ?? 0
        
        if rw <= 0 || rd <= 0 {
            return "Enter a positive value"
        }
        if rw > 1000 || rd > 1000 {
            return "Value is too large"
        }
        if rw < 1 || rd < 1 {
            return "Value is too small"
        }
        return String((rw / 2) + (2 * (rd / 2)))
    }
}