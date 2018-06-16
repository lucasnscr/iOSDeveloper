//
//  MealsTableViewController.swift
//  Alura
//
//  Created by Lucas do Nascimento Silva on 15/06/2018.
//  Copyright © 2018 Lucas do Nascimento Silva. All rights reserved.
//

import UIKit

class MealsTableViewController :   UITableViewController{ //HERANCA
    
    var meals: Array<Meal> = [Meal(nome: "Arroz", alegria: 5), Meal(nome: "Feijao", alegria: 4)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row  =  indexPath.row
        
        let meal = meals[row]
        
        let cell =  UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        
        cell.textLabel!.text = meal.nome
        
        return cell
        
    }
    
    
}
