//
//  Untitled.swift
//  Game1
//
//  Created by Ethan Allgaier on 12/11/25.
//
import SwiftUI
import SwiftData

@Observable // allowd swift ui to update when values change
class NewGameViewModel {
    var title: String = ""
    var players: [GamePlayer] = []
    var gameIcon: String = ""
    var highestWins: Bool = true
    var sortByHighestScore: Bool = true
    var playerName = ""     // Stores what user types
    var playerIcon: String = ""
    
    let sfSymbols = [
        
        "bolt",
        "flame",
        "sparkles",
        "burst",
        "shield",
        "target",
        "scope",
        
        "crown",
        
        
        "trophy.fill",
        "medal.fill",
        
        "rosette",
        
        
            ]

    
 //Func for saving new game
    func saveGame(context: ModelContext) {
            let newGame = Game(
                gameTitle: title,
                players: players,
                gameIcon: gameIcon,
                highestWins: highestWins,
                sortByHighestScore: sortByHighestScore
            )
            context.insert(newGame)
        }
    
    
// Func for adding player to a game
    //context: ModelContext is for saving to swift data
    func addPlayer(context: ModelContext) {
        guard !playerName.isEmpty else { return } // if no name is entered will stop the func
       
        let newPlayer = GamePlayer(//new player object
            playerName: playerName,
            playerIcon: "person.circle.fill",
            playerScore: 0// players start at 0
        )
    
        context.insert(newPlayer)  // saves to swift data
        players.append(newPlayer)  // add to the games list 
        playerName = ""// clears the input for next plzyer
        
    }
    
    
    
    
    // adding player to excisitng game
    func addAdditionalPlayer(to game: Game, context: ModelContext) {
        guard !playerName.isEmpty else { return }

        let newPlayer = GamePlayer(
            playerName: playerName,
            playerIcon: "person.circle.fill",
            playerScore: 0
        )

        context.insert(newPlayer)      // persist in SwiftData
        game.players.append(newPlayer) // add to game's player list
        playerName = ""
    }
    
    
    
    

//Func for deleting player from game 
    func deletePlayer(at offsets: IndexSet, context: ModelContext) {
        for index in offsets {
            let player = players[index]
            context.delete(player)   // delete from SwiftData
        }
        players.remove(atOffsets: offsets)
    }

}


