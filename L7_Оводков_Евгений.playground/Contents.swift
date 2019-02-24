import Cocoa

enum SmartNavigatorError: Error {
    
    case notEnoughFuel (fuelNeeded: Int)
    case unknownDestination
}
struct City {
    
    let title: String
}

struct Destination {
    
    var timeToArrive: Double
    let direction: City
    var fuelNeeded: Int
    
    init (timeToArrive: Double, direction: City, fuelNeeded: Int) {
        self.timeToArrive = timeToArrive
        self.direction = direction
        self.fuelNeeded = fuelNeeded
    }
    
}

class SmartNavigator {
    
    var dataBase = ["Moscow": Destination (timeToArrive: 12.5, direction: City (title: "Moscow"), fuelNeeded: 120 ),"Paris": Destination (timeToArrive: 24.6, direction: City (title: "Paris"), fuelNeeded: 433 ),"Berlin": Destination (timeToArrive: 8.0, direction: City (title: "Berlin"), fuelNeeded: 78 )]
    
    var filledFuel = 100
    
    func route (_ title: String) throws -> City {
        guard let newDirection = dataBase[title] else {
            throw SmartNavigatorError.unknownDestination
        }
        
        guard filledFuel > newDirection.fuelNeeded else {
            throw SmartNavigatorError.notEnoughFuel (fuelNeeded: newDirection.fuelNeeded - filledFuel)
        }
        return newDirection.direction
    }
}

let smartNavigator = SmartNavigator()

do {
    let route1 = try smartNavigator.route("Paris")
    
//    print ("Road to \(Destination.direction) will take \(Destination.timeToArrive) hours.")
    
} catch SmartNavigatorError.unknownDestination {
    print ("This city doesn't exist in Data Base!")
    
} catch SmartNavigatorError.notEnoughFuel ( let fuelNeeded ) {
    print ("Not enough fuel. Please fill \(fuelNeeded) liters more!")

}






