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
        "Terra":Planet(planetName: .earth, planetImage: .earth, peso:"5.97237×10ˆ24 kg" , area: "510072000 kmˆ2", volume: "1.08321×10ˆ12 kmˆ3", raio: "6371.0 km", densidade: "5.514 g/cmˆ3", gravidade: "9.807 m/sˆ2", pressao: "101.325 kPa", satelites: ["Moon"], temAgua: true, tempoRotacao: "1 dia", distanciaDoSol: "149.600.000 km"),
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
    var actualField: String!
    var actualPlanet = Planet(planetName: .earth, planetImage: .bb8, peso: "none", area: "none", volume: "none", raio: "none", densidade: "none", gravidade: "none", pressao: "none", satelites: [], temAgua: false, tempoRotacao: "none", distanciaDoSol: "none")
    var hasReceivedReturnButton = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userMessage.delegate = self
        setInitConfig()
        
    }
    
    func setInitConfig() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "galaxyBackground")!)
        userMessage.attributedPlaceholder = NSAttributedString(string: "Pergunte para o BB-8", attributes:              [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 0.84, blue: 0, alpha: 1)])
    }
    
    @IBAction func textFieldDidEndEditing(_ sender: UITextField) {
        
        sentMessage = sender.text!
        self.view.endEditing(true)
        
        if hasReceivedReturnButton == false {
            readBotState(planet: actualPlanet.planetName.rawValue)
            hasReceivedReturnButton = true
        }
        else {
            hasReceivedReturnButton = false
        }
        
    }
    
    @IBAction func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = " "
    }
    
    func readBotState(planet: String){
        switch botState.state {
        case .start:
            suggestionState()
            
        case .gettingPlanet:
            readUserPlanet(planet: planets[planet]!)
            
        case .readingPlanetInformation:
            readPlanetInformation(planet: planets[planet]!)
            
        case .finishedPlanet:
            finishedPlanet(planet: planets[planet]!)
        
        default:
            print("failed at readbotstate")
        }
    }
    
    func suggestionState() {
        
        //botState.state = .gettingPlanet
        
        let errorMessages = ["Hmmm, não conheço esse planeta", "Acho que não entendi o que você quis dizer", "Isso está fora do meu conhecimento!"]
        
       
        switch sentMessage.lowercased().contains(" ") {
            
        case sentMessage.lowercased().contains("ter") && !sentMessage.lowercased().contains("jup"):
            actualPlanet = planets["Terra"]!
            botState.state = .gettingPlanet
            readBotState(planet: "Terra")
            
        case sentMessage.lowercased().contains("jup"):
            actualPlanet = planets["Jupiter"]!
            botState.state = .gettingPlanet
            readBotState(planet: "Jupiter")
           
            
        case sentMessage.lowercased().contains("mar"):
            actualPlanet = planets["Marte"]!
            botState.state = .gettingPlanet
            readBotState(planet: "Marte")
            
            
        case  sentMessage.lowercased().contains("mer"):
            actualPlanet = planets["Mercurio"]!
            botState.state = .gettingPlanet
            readBotState(planet: "Mercurio")
            
            
        case sentMessage.lowercased().contains("net"):
            actualPlanet = planets["Netuno"]!
            botState.state = .gettingPlanet
            readBotState(planet: "Netuno")
            
            
        case sentMessage.lowercased().contains("satu"):
            actualPlanet = planets["Saturno"]!
            botState.state = .gettingPlanet
            readBotState(planet: "Saturno")
            
            
        case sentMessage.lowercased().contains("sol"):
            actualPlanet = planets["Sol"]!
            botState.state = .gettingPlanet
            readBotState(planet: "Sol")
           
            
        case sentMessage.lowercased().contains("ura"):
            actualPlanet = planets["Urano"]!
            botState.state = .gettingPlanet
            readBotState(planet: "Urano")

            
        case sentMessage.lowercased().contains("ven"):
            actualPlanet = planets["Venus"]!
            botState.state = .gettingPlanet
            readBotState(planet: "Venus")
        
        
        default:
            botMessage.text = errorMessages[ Int.random(in: 0..<errorMessages.count) ]
        }
    }
    
    func readUserPlanet(planet: Planet) {
        
        let possiblePrefixes = ["Hmmm, eu adoro ", "Eu sabia que você ia escolher ", "Então você está interessado por "]
        
        let possibleSufixes = ["Que tal descobrir", "Quer saber", "Te interessa"]
        
     //   let possibleFields = ["seu peso?":planet.peso!, "sua área?":planet.area!, "seu volume?":planet.volume!, "seu raio?":planet.raio!, "sua densidade?":planet.densidade!, "sua gravidade?":planet.gravidade!, "sua pressão?":planet.pressao!, "seus satélites?":planet.satelites!, "se há água?":planet.temAgua!, "seu tempo de rotação?":planet.tempoRotacao!, "sua distância até o sol?":planet.distanciaDoSol!] as [String : Any]
        
        let possibleFields = ["seu peso?", "sua área?", "seu volume?", "seu raio?", "sua densidade?", "sua gravidade?", "sua pressão?",  "seus satélites?", "se há água?", "seu tempo de rotação?", "sua distância até o sol?"]
        
        let randomPrefix = possiblePrefixes[
            Int.random(in: 0..<possiblePrefixes.count)
        ]
        
        let randomSufix = possibleSufixes[Int.random(in: 0..<possibleSufixes.count)]
        
        let randomField = possibleFields[Int.random(in: 0..<possibleFields.count)]
            actualField = randomField
        
        let firstPhrase = randomPrefix + planet.planetName.rawValue + "! "
        
        let secondPhrase = randomSufix + " " + randomField
        
        botMessage.text = firstPhrase + secondPhrase
        
        planetImage.image = UIImage(named: planet.planetName.rawValue)
        planetText.text = "\(planet.planetName.rawValue)"
        planetText.alpha = 1
        
       
        
        botState.state = .readingPlanetInformation
    }
    
    func readPlanetInformation(planet: Planet) {
        
        let possibleFields = ["seu peso?", "sua área?", "seu volume?", "seu raio?", "sua densidade?", "sua gravidade?", "sua pressão?",  "seus satélites?", "se há água?", "seu tempo de rotação?", "sua distância até o sol?"]
        
        let negativeAnswers = ["Droga! Que tal", "Imaginei... Te interessa", "Uma pena, pois eu adoro essa área... Quer saber sobre"]
        
        let misunderstood = ["Hmmm, não entendi sua resposta", "Pode me perguntar outra coisa, por favor?", "Desculpe, não entendi"]
        
        switch sentMessage.lowercased().contains(" ") {
        case sentMessage.contains("nao") || sentMessage.contains("não") || sentMessage.contains("nah")  || sentMessage.contains("naum"):
            let randomNegativeAnswer = negativeAnswers[Int.random(in: 0..<negativeAnswers.count)]
            let newRandomField = possibleFields[Int.random(in: 0..<possibleFields.count)]
            actualField = newRandomField
            
            botMessage.text = randomNegativeAnswer + " " + newRandomField
            
        case sentMessage.contains("sim") || sentMessage.contains("aham") || sentMessage.contains("claro") || sentMessage.contains("bastante") || sentMessage.contains("muito") || sentMessage.contains("quer"):
            
            switch actualField {
            case "seu peso?":
                botMessage.text = "O peso de \(planet.planetName.rawValue) é \(planet.peso!)! O que mais você quer saber?"
                botState.state = .finishedPlanet
                
            case "sua área?":
                botMessage.text = "A área da superfície  de \(planet.planetName.rawValue) é \(planet.area!)! O que mais você quer saber?"
                botState.state = .finishedPlanet
                
            case "seu volume?":
                botMessage.text = "O volume de \(planet.planetName.rawValue) é \(planet.volume!)! O que mais você quer saber?"
                botState.state = .finishedPlanet
                
            case "seu raio?":
                botMessage.text = "O raio de \(planet.planetName.rawValue) é \(planet.raio!)! O que mais você quer saber?"
                botState.state = .finishedPlanet
                
            case "sua densidade?":
                botMessage.text = "A densidade de \(planet.planetName.rawValue) é \(planet.densidade!)! O que mais você quer saber?"
                botState.state = .finishedPlanet
                
            case "sua gravidade?":
                botMessage.text = "A gravidade de \(planet.planetName.rawValue) é \(planet.gravidade!)! O que mais você quer saber?"
                botState.state = .finishedPlanet
                
            case "sua pressão?":
                botMessage.text = "A pressao de \(planet.planetName.rawValue) é \(planet.pressao!)! O que mais você quer saber?"
                botState.state = .finishedPlanet
                
            case "seus satélites?":
                botMessage.text = "Os satélites de \(planet.planetName.rawValue) são \(planet.satelites!)! O que mais você quer saber?"
                botState.state = .finishedPlanet
                
            case "se há água?":
                if planet.temAgua == true {
                    botMessage.text = "\(planet.planetName.rawValue) possui água! O que mais você quer saber?"
                }
                else {
                    botMessage.text = "\(planet.planetName.rawValue) não possui água! O que mais você quer saber?"
                }
                botState.state = .finishedPlanet
                
            case "seu tempo de rotação?":
                botMessage.text = "O tempo de rotação de \(planet.planetName.rawValue) é de \(planet.tempoRotacao!)! O que mais você quer saber?"
                botState.state = .finishedPlanet
                
            case "sua distância até o sol?":
                botMessage.text = "A distância de \(planet.planetName.rawValue) até o Sol é de \(planet.distanciaDoSol!)! O que mais você quer saber?"
                botState.state = .finishedPlanet
                
            default:
                botMessage.text = "Desculpe, essa informação vou ficar te devendo..."
            }


        default:
            botMessage.text = misunderstood[Int.random(in: 0..<misunderstood.count)]
        }
    }
    
    func finishedPlanet(planet: Planet){
        
//        switch sentMessage.lowercased().contains(" ") {
//        case sentMessage.contains(" "):
//            <#code#>
//        default:
//            <#code#>
//        }
        
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

