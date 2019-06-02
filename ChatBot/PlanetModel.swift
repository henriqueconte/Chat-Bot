//
//  PlanetModel.swift
//  ChatBot
//
//  Created by Henrique Figueiredo Conte on 01/06/19.
//  Copyright © 2019 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation

enum solarSystemAssets: String {
    case galaxyBackground = "galaxyBackground"
    case earth = "earth"
    case bb8 = "bb8"
    case jupiter = "jupiter"
    case mars = "mars"
    case mercury = "mercury"
    case neptune = "neptune"
    case r2d2 = "r2d2"
    case saturn = "saturn"
    case sun = "sun"
    case uranus = "uranus"
    case venus = "venus"
}

enum planetName: String {
    case earth = "Terra"
    case jupiter = "Jupiter"
    case mars = "Marte"
    case mercury = "Mercúrio"
    case neptune = "Netuno"
    case saturn = "Saturno"
    case sun = "Sol"
    case uranus = "Urano"
    case venus = "Venus"
}

class Planet {
    
    var planetName: planetName!
    var planetImage: solarSystemAssets!
    var peso: String!
    var area: String!
    var volume: String!
    var raio: String!
    var densidade: String!
    var gravidade: String!
    var pressao: String!
    var satelites: [String]!
    var temAgua: Bool!
    var tempoRotacao: String!
    var distanciaDoSol: String!

    init(planetName: planetName, planetImage: solarSystemAssets, peso: String, area: String, volume: String, raio: String, densidade: String, gravidade: String, pressao: String, satelites: [String], temAgua: Bool, tempoRotacao: String, distanciaDoSol: String) {
        
        self.planetName = planetName
        self.planetImage = planetImage
        self.peso = peso
        self.area = area
        self.volume = volume
        self.raio = raio
        self.densidade = densidade
        self.gravidade = gravidade
        self.pressao = pressao
        self.satelites = satelites
        self.temAgua = temAgua
        self.tempoRotacao = tempoRotacao
        self.distanciaDoSol = distanciaDoSol
    }
}
