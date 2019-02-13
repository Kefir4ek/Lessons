import Cocoa

protocol Car  {
    var color: String { get set }
    var mark: String { get set }
    
    func startEngine ()
    func stopEngine()
    func closeDoor()
    func openDoor ()
}

extension Car {
    func startEngine () {
        print ("Двигатель запущен")
    }
    func stopEngine() {
        print ("Двигатель остановлен")
    }
    func closeDoor() {
        print ("У машины \(mark) двери закрыты")
    }
    func openDoor() {
        print ("У машины \(mark) двери открыты")
    }
}

class SportCar: Car {
    var color: String
    var mark: String
    var price: Int
    var hatch: Bool
   
    func openHatch() {
        if hatch == true {
            print ("На машины \(mark) люк можно открыть, нажав на кнопку!")
        } else {
            print ("У машины \(mark) люка нет")
        }
        
    }
    init (color: String, mark: String, price: Int, hatch: Bool) {
        self.color = color
        self.mark = mark
        self.price = price
        self.hatch = hatch
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
         return "Машина \(mark), цвет \(color)"
    }
}

enum trunkStatus {
    case open
    case close
}

class TrunkCar: Car {
    var color: String
    var mark: String
    var weight: Int
    var trunk: trunkStatus
    
    func openTrunk() {
        if trunk == trunkStatus.close {
            trunk = trunkStatus.open
            print ("Открываю кузов у машины \(mark)")
        } else {
            print ("У машины \(mark) кузов уже открыт")
        }
        
    }
    
    init (color: String, mark: String, weight: Int, trunk: trunkStatus) {
    self.color = color
    self.mark = mark
    self.weight = weight
    self.trunk = trunk
    
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Машина \(mark), цвет \(color), вес \(weight) кг"
    }
}

var sportcar1 = SportCar (color: "White", mark: "Opel", price: 6786, hatch: false)
var trunkCar1 = TrunkCar (color: "Gray", mark: "Volvo", weight: 10000, trunk: .close)

print (sportcar1.description)
sportcar1.closeDoor()
sportcar1.openHatch()

print (trunkCar1.description)
trunkCar1.openTrunk()
trunkCar1.startEngine()


