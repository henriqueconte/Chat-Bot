//
//  ViewController.swift
//  ChatBot
//
//  Created by Henrique Figueiredo Conte on 12/05/19.
//  Copyright © 2019 Henrique Figueiredo Conte. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userMessage: UITextField!
    
    var sentMessage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userMessage.delegate = self
        setInitConfig()
        // Do any additional setup after loading the view.
    }
    
    func setInitConfig() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "galaxyBackground")!)
        userMessage.attributedPlaceholder = NSAttributedString(string: "Pergunte para o BB-8", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 0.84, blue: 0, alpha: 1)])
    }

    @IBAction func textFieldDidEndEditing(_ sender: UITextField) {
        
        sentMessage = sender.text!
        self.view.endEditing(true)
    }
    
    @IBAction func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.text = " "
   
    }
    
}

