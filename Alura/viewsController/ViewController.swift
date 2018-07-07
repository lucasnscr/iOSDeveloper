//
//  ViewController.swift
//  Alura
//
//  Created by Lucas do Nascimento Silva on 01/06/2018.
//  Copyright © 2018 Lucas do Nascimento Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemDelegate {
    

    @IBOutlet var nomeField : UITextField?
    
    @IBOutlet var alegriaField :  UITextField?
    
    var delegate : AddMealDelegate?
    
    var itens: Array<Item> = [Item(nomeItem: "Frango", caloriasItem: 200), Item(nomeItem: "Salmão", caloriasItem: 180)]
    
    var itensSelecionado = Array<Item>()
    
    
    @IBOutlet var tableView : UITableView?
    
    
    
    @IBAction func add(){
        
        let nome:String =  (nomeField?.text)!
        
        if let alegria:Int =  Int(alegriaField!.text!){
            
            let meal = Meal(nome: nome, alegria: alegria, itens: itensSelecionado)
            
            print("Minha refeicao \(meal.nome) e minha alegria é \(meal.alegria), e os itens da minha refeicao sao \(meal.itens)")
            
            if (delegate == nil){
                return
            }else{
                delegate!.addArray(meal)
            }
            
            if let navigation = navigationController{
                //deletando tela atual
                navigation.popViewController(animated: true)
                
            }

            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row =  indexPath.row
        
        let item = itens[row]
        
        let cell =  UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        
        cell.textLabel!.text =  item.nomeItem
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath){
            if (cell.accessoryType == UITableViewCellAccessoryType.none){
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                
                let item  = itens[indexPath.row]
                
                itensSelecionado.append(item)
                
            }else{
                
                cell.accessoryType = UITableViewCellAccessoryType.none
                
                let item =  itens[indexPath.row]
                
                if let position = itensSelecionado.index(of: item){
                    itensSelecionado.remove(at: position)
                    
                }
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        
       let novoItemButton = UIBarButtonItem(title: "Novo item", style: UIBarButtonItemStyle.plain, target: self, action: #selector(novoItem))
        
        navigationItem.rightBarButtonItem = novoItemButton
        
    }
    
    @objc func novoItem(){
        let novoItem = NewItemViewController(delegate: self)
        if let navigation =  navigationController {
            navigation.pushViewController(novoItem , animated: true)
        }
    }
    
    func addItem(_ item: Item) {
        itens.append(item)
        if let table = tableView{
            table.reloadData()
        }else{
            let alert = UIAlertController(title: "Erro ao atualizar tabela", message: "Erro desconhecido", preferredStyle: UIAlertControllerStyle.alert)
            
            let button = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
          
            alert.addAction(button)
            
            present(alert, animated: true, completion: nil)
            
        }
    }

}

