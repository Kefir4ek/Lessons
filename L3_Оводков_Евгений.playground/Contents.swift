import Foundation

enum EngineStatus {
   
    case on, off
    
}

enum FilledTrunkValue {
    
    case full, semifull, empty
}

enum WindowsStatus {
    
    case close, open
    
}

struct Car {
    let mark: String
    let year: Int
    var trunkValue: Int
    var filledTrunkValue: FilledTrunkValue
    var engine: EngineStatus
    var windows: WindowsStatus
    
    mutating func closeWindow() {
        self.windows = .close
    }
    
    mutating func openWindow() {
        self.windows = .open
    }
    
    func carInfo()  {
        if self.filledTrunkValue == .empty {
            print("Машина марки \(mark), \(year) года выпуска, объем багажника \(trunkValue) литров и он пуст. \n")
        } else if self.filledTrunkValue == .semifull {
            print("Машина марки \(mark), \(year) года выпуска, объем багажника \(trunkValue) литров и он загружен на половину. \n")
        } else {
            print("Машина марки \(mark), \(year) года выпуска, объем багажника \(trunkValue) литров и он загружен полностью. \n")
        }
    }
}

struct Truck {
    let mark: String
    let year: Int
    var trunkValue: Int
    var filledTrunkValue: FilledTrunkValue
    var engine: EngineStatus
    var windows: WindowsStatus
    
    mutating func turnOffEngine(){
        self.engine = .off
    }
    
    mutating func turnOnEngine(){
        self.engine = .on
    }
    
    func truckInfo()  {
        print("Машина марки \(mark), \(year) года выпуска, объем багажника \(trunkValue) литров \n")
    }
    
}
var car1 = Car (mark: "Opel", year: 2016, trunkValue: 60, filledTrunkValue: .full, engine: .off, windows: .close)

var truck1 = Truck (mark: "Scania", year: 2004, trunkValue: 400, filledTrunkValue: .semifull, engine: .off, windows: .open)

car1.openWindow()
car1.carInfo()
truck1.truckInfo()
