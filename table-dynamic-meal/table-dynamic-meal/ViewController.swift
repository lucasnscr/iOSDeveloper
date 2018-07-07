//
//  ViewController.swift
//  table-dynamic-meal
//
//  Created by Lucas do Nascimento Silva on 14/06/2018.
//  Copyright © 2018 Lucas do Nascimento Silva. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let meals = ["arroz", "feijao", "macarrao"]
    
    //Método para view carregada
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("tela carregada")
        
    }
    //funcao retorna o numero de elementos do array para a tableview e quantas celular ele ira incrementar
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    //funcao que retorna valor para cada uma das respectivas celular
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //obtem indice do array
        let row = indexPath.row
        
        //obtem valor do array respectivo ao indice
        let meal =  meals[row]
        
        //instancia um table view padrao
        let cell  =  UITableViewCell(style:  UITableViewCellStyle.default, reuseIdentifier: nil)
       
        //acessa o textlabel do table view e retorna o valor do array = meal
        cell.textLabel!.text = meal
        
        return cell
    }

}
