import Foundation

// CALCULATION FUNCTIONS

class Calculators {
    
    let aspectRatio: Double = 1.78
    let minThrowRatio: Double = 1.1278195489
    let maxThrowRatio: Double = 1.098
    
    // Calculate Area
    func calculateArea(roomWidth: String, roomDepth: String) -> String {
        guard let rw = Double(roomWidth), let rd = Double(roomDepth) else {
            return "Invalid input"
        }
        return String(rw * rd)
    }
    
    // Calculate Screen Diagonal based on the chosen wall for the Screen
    func calculateScreenDiagonal(roomWidth: String) -> String {
        guard var rw = Double(roomWidth) else {
            return "Invalid input"
        }
        var screenDiagonal: Double = 120
        while rw < 3.657 {
            screenDiagonal -= 5
            rw += 0.111
        }
        return String(screenDiagonal * 2.54)
    }
    
    // Calculate the screen width based on the screen diagonal
    func calculateScreenWidth(roomWidth: String) -> String {
        let screenDiagonal = Double(calculateScreenDiagonal(roomWidth: roomWidth)) ?? 0
        guard Double(roomWidth) != nil else {
            return "Invalid input"
        }
        return String(round((pow( (pow(screenDiagonal, 2) / (1 + pow((1/aspectRatio),2))), 0.5))))
    }
    
    // Calculate the screen height based on the screen diagonal
    func calculateScreenHeight(roomWidth: String) -> String {
        let screenDiagonal = Double(calculateScreenDiagonal(roomWidth: roomWidth)) ?? 0
        guard Double(roomWidth) != nil else {
            return "Invalid input"
        }
        return String(round((pow((pow(screenDiagonal, 2) / (1 + pow(aspectRatio, 2))), 0.5))))
    }
    
    // Calculate the throw distance
    func calculateThrowDistance(roomWidth: String) -> String {
        
        let throwDistance =  Double(calculateScreenWidth(roomWidth: roomWidth))! / minThrowRatio
        return String(throwDistance)
    }
    
    // Calculate the MIN throw distance
    func calculateMaxThrowDistance(roomWidth: String) -> String {
        
        let minThrowDistance =  Double(calculateScreenWidth(roomWidth: roomWidth))! / maxThrowRatio
        return String(minThrowDistance)
    }

    // Calculate the Longest allowed viewing distance for THX certifications
    func calculateLongestAllowableViewingDistance(roomWidth: String) -> Double {
        let screenWidth = Double(calculateScreenWidth(roomWidth: roomWidth)) ?? 0
        let longestAllowableViewingDistance = ((screenWidth / 0.46173638224)) / 100  // 2x(tan(13???)
        return longestAllowableViewingDistance // returns in m
    }
    
    // Calculate the Shortest recommended viewing distance
    func calculateShortestRecommendedViewingDistance(roomWidth: String) -> Double {
        let screenWidth = Double(calculateScreenWidth(roomWidth: roomWidth)) ?? 0
        let shortestRecommendedViewingDistance = ((screenWidth / 1.40041507642) ) / 100 // 2x(tan(35???)
        return shortestRecommendedViewingDistance // returns in m
    }
    
    // Calculate the number of listeners
    func calculateNumberOfPeople(roomWidth: String) -> String {
        guard let rw = Double(roomWidth) else {
            return "Invalid input"
        }
        let lvd = calculateLongestAllowableViewingDistance(roomWidth: roomWidth)
        let svd = calculateShortestRecommendedViewingDistance(roomWidth: roomWidth)
        let areaOfSeats = ((rw-2) * (lvd - svd))
        let numberOfPeople = floor(areaOfSeats / 1.1) // 1.1m?? per person
        return String(Int(numberOfPeople))
    }
    func calculateWidthLamps(roomWidth: String) -> String {
            guard let rw = Double(roomWidth) else {
                return "Invalid input"
            }
            if rw < 0 || rw != floor(rw) {
                return "Invalid input"
            }
            return String(floor(rw / 2))
        }
    
    func calculateDepthLamps(roomDepth: String) -> String {
            guard let rd = Double(roomDepth) else {
                return "Invalid input"
            }
            if rd < 0 || rd != floor(rd) {
                return "Invalid input"
            }
            return String(floor(rd / 2))
        }
    
    func calculateTotalLamps(roomWidth: String, roomDepth: String) -> String {
        let widthLamps = Double(calculateWidthLamps(roomWidth: roomWidth))!
        let depthLamps = Double(calculateDepthLamps(roomDepth: roomDepth))
  
        return String((widthLamps + (depthLamps! * 2)))
    }
    

}
