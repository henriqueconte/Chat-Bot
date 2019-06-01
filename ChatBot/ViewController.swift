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
    @IBOutlet weak var planetImage: UIImageView!
    @IBOutlet weak var botMessage: UILabel!
    
    var planet = Planet()
    var botState = BotState(state: .start)
    var sentMessage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userMessage.delegate = self
        setInitConfig()
        
    }
    
    func setInitConfig() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "galaxyBackground")!)
        userMessage.attributedPlaceholder = NSAttributedString(string: "Pergunte para o BB-8", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 0.84, blue: 0, alpha: 1)])
    }

    @IBAction func textFieldDidEndEditing(_ sender: UITextField) {
        
        sentMessage = sender.text!
        self.view.endEditing(true)
        
        suggestionState()
    }
    
    @IBAction func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = " "
        
    }
    
    func readBotState(planet: String){
        switch botState.state {
        case .start:
            suggestionState()
            
        case .gettingPlanet:
            readUserPlanet(planet: planet)
        default:
            print("failed at readbotstate")
        }
    }
    
    func suggestionState() {
        
        botState.state = .gettingPlanet
        switch sentMessage.lowercased().contains(" ") {
            
        case sentMessage.lowercased().contains("ter"):
            readBotState(planet: "Terra")
           // readUserPlanet(planet: "Terra")
        
        case sentMessage.lowercased().contains("jup"):
            readBotState(planet: "Jupiter")
            
        case sentMessage.lowercased().contains("mar"):
            readBotState(planet: "Marte")
        
        case  sentMessage.lowercased().contains("mer"):
            readBotState(planet: "Mercúrio")
            
        case sentMessage.lowercased().contains("net"):
            readBotState(planet: "Netuno")
            
        case sentMessage.lowercased().contains("satu"):
            readBotState(planet: "Saturno")
            
        case sentMessage.lowercased().contains("sol"):
            readBotState(planet: "Sol")
            
        case sentMessage.lowercased().contains("ura"):
            readBotState(planet: "Urano")
            
        case sentMessage.lowercased().contains("ven"):
            readBotState(planet: "Venus")
            
        default:
            print("default")
        }
    }
    
    func readUserPlanet(planet: String) {
        
        let possiblePrefixes = ["Hmmm, eu adoro ", "Eu sabia que você ia escolher ", "Então você está interessado por"]
        
     //   let possibleSufixes = []
        let randomPrefix = possiblePrefixes[
            Int.random(in: 0..<possiblePrefixes.count)
        ]
        
        botMessage.text = randomPrefix + planet + "!"
        
        
        
    }
    
//    case earth = "Earth"
//    case jupiter = "Jupiter"
//    case mars = "Mars"
//    case mercury = "Mercury"
//    case neptune = "Neptune"
//    case saturn = "Saturn"
//    case sun = "Sun"
//    case uranus = "Uranus"
//    case venus = "Venus"
}

