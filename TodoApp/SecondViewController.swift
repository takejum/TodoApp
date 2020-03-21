//
//  SecondViewController.swift
//  TodoApp
//
//  Created by Jumpei Takeshita on 2020/03/17.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var todoString = String()
    
    
    @IBOutlet weak var todoContents: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoContents.text = todoString
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       //hiding navigation controller at the top
        navigationController?.isNavigationBarHidden = false
    }
    
    
    

}
