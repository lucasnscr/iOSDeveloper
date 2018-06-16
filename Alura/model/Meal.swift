

import Foundation

class Meal {
    
    let nome:String
    let alegria:Int
    let itens = Array<Item>()
    
    init(nome:String, alegria:Int) {
        self.nome = nome
        self.alegria = alegria
    }
    
    func allCalories() -> Double{
        var total:Double = 0.0
        for item in itens {
            total += item.caloriasItem
        }
        
        return total
        
    }
    
}
