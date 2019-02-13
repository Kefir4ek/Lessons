import Foundation

enum EngineStatus {
    
    case on, off
    
}

enum CarHatchState {
   
    case open, close
}

enum WindowsStatus {
    
    case close, open
    
}

class Car {
    let mark: String
    let year: Int
    var trunkValue: Int
    var engine: EngineStatus
    var windows: WindowsStatus
    
    init(mark: String, year: Int, trunkValue: Int, engine: EngineStatus, windows: WindowsStatus) {
        self.mark = mark
        self.year = year
        self.trunkValue = trunkValue
        self.engine = engine
        self.windows = windows
    }
    
    func closeWindow() {
        self.windows = .close
    }
    
    func openWindow() {
        self.windows = .open
    }
}
class sportCar: Car {
    var hatchState: CarHatchState
    
    init(mark: String, year: Int, trunkValue: Int, engine: EngineStatus, windows: WindowsStatus, hatchState: CarHatchState) {
        self.hatchState = hatchState
        super.init(mark: mark, year: year, trunkValue: trunkValue, engine: engine, windows: windows)
    }
    func hatchOpen() {
        self.hatchState = .open
    }
    func hatchClose()  {
        self.hatchState = .close
    }
}

class trunkCar: Car {
    var lenght: Int
    
    init(mark: String, year: Int, trunkValue: Int, engine: EngineStatus, windows: WindowsStatus, lenght: Int) {
        self.lenght = lenght
        super.init(mark: mark, year: year, trunkValue: trunkValue, engine: engine, windows: windows)
    }
    override func openWindow() {
        print ("Окна в автомобиле \(mark) заблокированы и не могут быть открыты!")
    }
}
    var trunkCar1 = trunkCar (mark: "DAF", year: 2000, trunkValue: 400, engine: .off, windows: .close, lenght: 10)
    var sportCar1 = sportCar (mark: "BMW", year: 2008, trunkValue: 40, engine: .off, windows: .close, hatchState: .close)

trunkCar1.openWindow()



    
