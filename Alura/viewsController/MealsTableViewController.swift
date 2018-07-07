//
//  MealsTableViewController.swift
//  Alura
//
//  Created by Lucas do Nascimento Silva on 15/06/2018.
//  Copyright © 2018 Lucas do Nascimento Silva. All rights reserved.
//

import UIKit

class MealsTableViewController :   UITableViewController, AddMealDelegate{ //HERANCA
    
    var meals: Array<Meal> = [Meal(nome: "Arroz", alegria: 5, itens:[]),
                              Meal(nome: "Feijao", alegria: 4, itens:[])]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row  =  indexPath.row
        
        let meal = meals[row]
        
        let cell =  UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        
        cell.textLabel!.text = meal.nome
        
         let longPress = UILongPressGestureRecognizer(target: self, action: #selector(detalheRefeicao))
        
        cell.addGestureRecognizer(longPress)
        
        return cell
        
    }
    
    @objc func detalheRefeicao(recognizer: UILongPressGestureRecognizer){
        if (recognizer.state == UIGestureRecognizerState.began){
            let cell = recognizer.view as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell){
                let row = indexPath.row
                let refeicao = meals[row]
                
                let details = UIAlertController(title: refeicao.nome, message: refeicao.refeicaoDetalhes(), preferredStyle: UIAlertControllerStyle.alert)
                
                let alert = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel , handler: nil)
                
                details.addAction(alert)
                
                present(details, animated: true, completion: nil)
            }
            
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "adicionarRefeicao"){
            let view:ViewController = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    //Funcao do underline _ (o primeiro parametro da funcao, nao precisa ter o nome explicito quando invoca ela)
    
    func addArray(_ meal:Meal){
    
        meals.append(meal)
        tableView.reloadData()
        
    }
    
}
