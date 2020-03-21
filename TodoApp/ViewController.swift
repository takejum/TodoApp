//
//  ViewController.swift
//  TodoApp
//
//  Created by Jumpei Takeshita on 2020/03/17.
//  Copyright © 2020 Jumpei Takeshita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var todoTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //activate delegate methods
        todoTextField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       //hiding navigation controller at the top
        navigationController?.isNavigationBarHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.selectionStyle = .none
        cell.textLabel!.text = textArray[indexPath.row]
        cell.imageView!.image = UIImage(named: "checkBox2")
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SecondVC = storyboard?.instantiateViewController(identifier: "Next") as! SecondViewController
        
        SecondVC.todoString = textArray[indexPath.row]
        navigationController?.pushViewController(SecondVC, animated: true)
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/6
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textArray.append(textField.text!)
        todoTextField.resignFirstResponder()
        todoTextField.text = ""
        tableView.reloadData()
        
        return true
    }
    
}

