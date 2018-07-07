//
//  Item.swift
//  Alura
//
//  Created by Lucas do Nascimento Silva on 12/06/2018.
//  Copyright © 2018 Lucas do Nascimento Silva. All rights reserved.
//

import Foundation

class Item: Equatable {
    
    let nomeItem:String
    let caloriasItem:Double
    
    init(nomeItem:String, caloriasItem:Double) {
        self.nomeItem =  nomeItem
        self.caloriasItem = caloriasItem
    }
    
}

func ==(item1 : Item, item2 : Item) -> Bool {
    return item1.nomeItem == item2.nomeItem && item1.caloriasItem ==  item2.caloriasItem
}

