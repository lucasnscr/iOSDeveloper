//
//  NewItemViewController.swift
//  Alura
//
//  Created by Lucas do Nascimento Silva on 25/06/2018.
//  Copyright © 2018 Lucas do Nascimento Silva. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    var delegate: AddItemDelegate?
    
    init(delegate: AddItemDelegate) {
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet var nomeItemField : UITextField?
    
    @IBOutlet var caloriasItemField :  UITextField?
    
    @IBAction func addNovoItem(){
        
        if (nomeItemField == nil || caloriasItemField == nil || delegate == nil) {
            return
        }
        
        let nomeItem: String = nomeItemField!.text!
        if let caloriasItem: Double = Double(caloriasItemField!.text!){
            let item = Item(nomeItem: nomeItem, caloriasItem: caloriasItem)
            delegate!.addItem(item)
        }
        
        if let navigation = navigationController{
            navigation.popViewController(animated: true)
        }
        
    }
    
}
