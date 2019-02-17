import Cocoa

protocol Price {
    var price: Double { get set }
}

class Food: Price {
    var price: Double
    var weight: Double
    var title: String
    
    init (price: Double, weight: Double, title: String) {
        self.price = price
        self.weight = weight
        self.title = title
    }
}

struct ShoppingList<T: Price> {
    var elements: [T] = []
    
    mutating func add (_ element: T) {
        elements.append(element)
    }
    
    mutating func remove () -> T?  {
        return elements.removeLast()
        
    }
   
    var totalPrice: Double {
    var price = 0.0
    for element in elements {
        price += element.price
    }
    return price
    }

    subscript (index: Int?) -> T {
        
        return elements[index!]
    }

    subscript (elements: Int ...) -> Double {
    var price = 0.0
    for index in elements where index < self.elements.count {
        price += self.elements[index].price
    }
    return price
  }
}

var shoppingList1 = ShoppingList<Food>()
shoppingList1.add(Food(price: 40.4, weight: 10, title: "Potato"))
shoppingList1.add(Food(price: 65, weight: 2, title: "Orange"))
shoppingList1.add(Food(price: 112.3, weight: 7.5, title: "Peper"))
shoppingList1.add(Food(price: 43.6, weight: 4, title: "Tomato"))

print (shoppingList1 [0,2])
print (shoppingList1.totalPrice)

print (shoppingList1.elements.filter { $0.price > 50 }.count)
print (shoppingList1.elements.map {$0.title})
print (shoppingList1.elements.sorted (by: {$0.weight > $1.weight}).map {$0.weight})
