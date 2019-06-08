//
//  BotState.swift
//  ChatBot
//
//  Created by Henrique Figueiredo Conte on 01/06/19.
//  Copyright © 2019 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation


enum state: String {
    case start = "start"
    case suggestingInfo = "suggestingInfo"
    case readingPlanetInformation = "readingPlanetInformation"
    case finishedPlanet = "finishedPlanet"
}

class BotState{
    
    var state: state
    
    init(state: state) {
        self.state = state
        self.state = .start
    }
}
