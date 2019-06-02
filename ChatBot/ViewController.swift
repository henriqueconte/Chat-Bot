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
    @IBOutlet weak var planetText: UILabel!
    
    var planets = [
        "Terra":Planet(planetName: .earth, planetImage: .earth, peso:"5.97237×10ˆ24 kg" , area: "510072000 km2,", volume: "1.08321×10ˆ12 kmˆ3", raio: "6371.0 km", densidade: "5.514 g/cmˆ3", gravidade: "9.807 m/sˆ2", pressao: "101.325 kPa", satelites: ["Moon"], temAgua: true, tempoRotacao: "1 dia", distanciaDoSol: "149.600.000 km"),
        "Jupiter":Planet(planetName: .jupiter, planetImage: .jupiter, peso: "1.8982×10ˆ27, kg", area: "6.1419×10ˆ10 kmˆ2", volume: "1.4313×10ˆ15 kmˆ3", raio: "69.911 km", densidade: "1,326 kg/mˆ3", gravidade: "24.79 m/sˆ2", pressao: "70 kPa", satelites: ["Europa", "Io", "Ganímedes", "e outros 76" ], temAgua: true, tempoRotacao: "10h", distanciaDoSol: "778.500.000 km"),
        "Marte":Planet(planetName: .mars, planetImage: .mars, peso: "6.4171×10ˆ23 kg", area: "144798500 kmˆ2", volume: "1.6318×10ˆ11 kmˆ3", raio: "3389.5 km", densidade: "3.9335 g/cmˆ3", gravidade: "3.72076 m/sˆ2", pressao: "0.636 kPa", satelites: ["Fobos", "Deimos"], temAgua: false, tempoRotacao: "1 dia", distanciaDoSol: "227.900.000 km"),
        "Mercurio":Planet(planetName: .mercury, planetImage: .mercury, peso: "3.3011×10ˆ23 kg", area: "7.48×10ˆ7 kmˆ2", volume: "6.083×10ˆ10 kmˆ3", raio: "2,439.7 km", densidade: "5.427 g/cmˆ3", gravidade: "3.7 m/sˆ2", pressao: "1 nano pascal", satelites: [], temAgua: true, tempoRotacao: "58 dias", distanciaDoSol: "57.910.000 km"),
        "Netuno":Planet(planetName: .neptune, planetImage: .neptune, peso: "1.02413×10ˆ26 kg", area: "7.6183×10ˆ9 kmˆ2", volume: "6.254×10ˆ13 kmˆ3", raio: "24,622 km", densidade: "1.638 g/cmˆ3", gravidade: "11.15 m/sˆ2", pressao: "10 kPa", satelites: ["Tritão", "Nereida", "Proteu", "e outros 11"], temAgua: true, tempoRotacao: "16h", distanciaDoSol: "4.504.300.000 km"),
        "Saturno":Planet(planetName: .saturn, planetImage: .saturn, peso: "5.6834×10ˆ26 kg", area: "4.27×10ˆ10 kmˆ2", volume: "8.2713×10ˆ14 kmˆ3", raio: "58,232 km", densidade: "0.687 g/cmˆ3", gravidade: "10.44 m/sˆ2", pressao: "140 kPa", satelites: ["Encélado", "Titã", "Mimas", "e outros 59"], temAgua: true, tempoRotacao: "10h", distanciaDoSol: "1.429.400.000"),
        "Sol":Planet(planetName: .sun, planetImage: .sun, peso: "1.9885×10ˆ30 kg", area: "6.09×10ˆ12 km2", volume: "1.41×1018 kmˆ3", raio: "696,342 km", densidade: "1.408 g/cmˆ3", gravidade: "274 m/sˆ2", pressao: "101.325 kPa", satelites: [], temAgua: false, tempoRotacao: "24 dias", distanciaDoSol: "0 km"),
        "Urano":Planet(planetName: .uranus, planetImage: .uranus, peso: "8.6810*10ˆ25 kg", area: "8.1156×109 kmˆ2", volume: "6.833×1013 kmˆ3", raio: "25,362 km", densidade:"1.27 g/cmˆ3", gravidade: "8.69 m/sˆ2", pressao: "100 kPa", satelites: ["Umbriel", "Oberon", "Titânia", "e outros 24"], temAgua: true, tempoRotacao: "17h", distanciaDoSol: "2.870.990.000"),
        "Venus":Planet(planetName: .venus, planetImage: .venus, peso: "4.8675×10ˆ24 kg", area: "4.6023×10ˆ8 kmˆ2", volume: "9.2843×10ˆ11 kmˆ3", raio: "6,051.8 km", densidade: "5.243 g/cmˆ3", gravidade: "8.87 m/sˆ2", pressao: "9090 kpa", satelites: [], temAgua: false, tempoRotacao: "116 dias", distanciaDoSol: "108.200.000 km")
    ]
    
    
    
    var botState = BotState(state: .start)
    var sentMessage: String!
    
    override func viewDidLoad()
        
        
    {
        super.viewDidLoad()
        userMessage.delegate =      self
        setInitConfig()
        
    }
    
    func setInitConfig() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "galaxyBackground")!)
        userMessage.attributedPlaceholder = NSAttributedString(string: "Pergunte para o BB-8", attributes:              [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 0.84, blue: 0, alpha: 1)])
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
            
        case sentMessage.lowercased().contains("ter") && !sentMessage.lowercased().contains("jup"):
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
        
        let possiblePrefixes = ["Hmmm, eu adoro ", "Eu sabia que você ia escolher ", "Então você está interessado por "]
        
        let possibleSufixes = ["Que tal descobrir", "Quer saber", "Te interessa"]
        
        let possibleFields = ["seu peso?", "sua área?", "seu volume?", "seu raio?", "sua densidade?", "sua gravidade?", "sua pressão?", "seus satélites?", "se há água?", "seu tempo de rotação?", "sua distância até o sol?"]
        
        let randomPrefix = possiblePrefixes[
            Int.random(in: 0..<possiblePrefixes.count)
        ]
        
        let randomSufix = possibleSufixes[Int.random(in: 0..<possibleSufixes.count)]
        
        let randomField = possibleFields[Int.random(in: 0..<possibleFields.count)]
        
        botMessage.text = randomPrefix + planet + "! " + randomSufix + " " + randomField
        
        planetImage.image = UIImage(named: planet)
        planetText.text = "\(planet)"
        planetText.alpha = 1
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
    
    //    var planetName: planetName!
    //    var planetImage: solarSystemAssets!
    //    var peso: Double!
    //    var area: Double!
    //    var volume: Double!
    //    var raio: Double!
    //    var densidade: Double!
    //    var gravidade: Double!
    //    var pressao: Int!
    //    var satelites: [String]!
    //    var temAgua: Bool!
    //    var tempoRotacao: Int!
    //    var distanciaDoSol: Int!
}

