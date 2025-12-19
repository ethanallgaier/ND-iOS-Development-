//
//  ScoreBoardViewModel.swift
//  Game1
//
//  Created by Ethan Allgaier on 12/16/25.
//

import SwiftUI
import SwiftData

@Observable
class ScoreBoardViewModel {

   var showAddplayerView: Bool = false
    
    var showEditGameView: Bool = false
// func for sorting the order of the player list
    func sortedPlayers(players: [GamePlayer], sortByHighestScore: Bool)  -> [GamePlayer] {
        if sortByHighestScore {
            return players.sorted(by: { $0.playerScore > $1.playerScore })
        } else {
            return players.sorted(by: { $0.playerScore < $1.playerScore })
        }
    }
 
    


}





