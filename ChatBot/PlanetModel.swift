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
    case earth = "Earth"
    case jupiter = "Jupiter"
    case mars = "Mars"
    case mercury = "Mercury"
    case neptune = "Neptune"
    case saturn = "Saturn"
    case sun = "Sun"
    case uranus = "Uranus"
    case venus = "Venus"
}

class Planet {
    
    var planetName: planetName!
    var peso: Double!
    var area: Double!
    var volume: Double!
    var densidade: Double!
    var gravidade: Double!
    var pressao: Int!
    
    
}
