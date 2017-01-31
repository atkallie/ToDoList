//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Ahmed T Khalil on 12/3/16.
//  Copyright © 2016 kalikans. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var task: UITextField!
    @IBAction func addTask(_ sender: Any) {
        
        let itemsObj = UserDefaults.standard.object(forKey: "myList")
        var items: [String]
        
        if let itemsTemp = itemsObj as? [String]{
            
            items = itemsTemp
            
            items.append(task.text!)
            
        }else{
            
            items = [task.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "myList")
        
        task.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addTask(Any.self)
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

