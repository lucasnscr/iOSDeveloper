

import Foundation

class Meal {
    
    let nome:String
    let alegria:Int
    let itens: Array<Item>
    
    init(nome:String, alegria:Int, itens :Array<Item> = []) {
        self.nome = nome
        self.alegria = alegria
        self.itens = itens
    }
    
    func allCalories() -> Double{
        var total:Double = 0.0
        for item in itens {
            total += item.caloriasItem
        }
        
        return total
        
    }
    
    func refeicaoDetalhes() -> String {
        var message = "Felicidade \(alegria)"
        for item in itens{
            message += "\n Nome: \(item.nomeItem) - Calorias: \(item.caloriasItem)"
        }
        
        return message
        
    }
    
}
