//
//  ViewController.swift
//  Alura
//
//  Created by Lucas do Nascimento Silva on 01/06/2018.
//  Copyright © 2018 Lucas do Nascimento Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nomeField : UITextField?
    
    @IBOutlet var alegriaField :  UITextField?
    
    @IBAction func add(){
        
        if (nomeField == nil || alegriaField ==  nil){
            return
        }
        
        let nome:String =  nomeField!.text!
        
        if let alegria:Int =  Int(alegriaField!.text!){
            
            let meal = Meal(nome: nome, alegria: alegria)
            
            print("Meu nome é \(meal.nome) e minha alegria é \(meal.alegria)")
            
            
            if let navigation = navigationController{
                //deletando tela atual
                navigation.popViewController(animated: true)
                
            }

            
        }
        
    }

}

