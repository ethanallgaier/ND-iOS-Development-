//
//  Game.swift
//  Game1
//
//  Created by Ethan Allgaier on 12/11/25.
//

import SwiftUI
import SwiftData// SwiftData will automatically save, load, and track changes.


//🕹️
@Model
class Game{
    
    var gameTitle: String = ""
    var players: [GamePlayer] = []
    var gameIcon: String = ""
    var highestWins: Bool = true
    var sortByHighestScore: Bool = true
    var winningPlayer: GamePlayer?
    var order: Int = 0 // for organizing
    
    
    init(gameTitle: String, players: [GamePlayer], gameIcon: String = "", highestWins: Bool = true, sortByHighestScore: Bool = true, winningPlayer: GamePlayer? = nil, order: Int = 0) {
        self.gameTitle = gameTitle
        self.players = players
        self.gameIcon = gameIcon
        self.highestWins = highestWins
        self.sortByHighestScore = sortByHighestScore
        self.winningPlayer = winningPlayer
        self.order = order
    }
}




@Model
class GamePlayer {
     var playerName: String = ""
     var playerIcon: String = "person.circle.fill"
     var playerScore: Int = 0
    
    init(playerName: String = "", playerIcon: String = "person.circle.fill", playerScore: Int = 0) {
        self.playerName = playerName
        self.playerIcon = playerIcon
        self.playerScore = playerScore
    }
}

// adding @Attribute ensures SwiftData tracks chanages
