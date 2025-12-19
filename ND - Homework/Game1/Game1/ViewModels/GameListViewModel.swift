//
//  GameListViewModel.swift
//  Game1
//
//  Created by Ethan Allgaier on 12/11/25.
//

import SwiftUI
import SwiftData

//Holding all my data + Logic for GameListView(only manages data)
@Observable
class GameListViewModel{
    var games: [Game] = []
    var isEditing: Bool = false
    var showAddGame: Bool = false
    

    // Function to handle game deletion (business logic in ViewModel)
    func deleteGame(at indexSet: IndexSet, from games: [Game], context: ModelContext) {
        indexSet.forEach { index in
            context.delete(games[index])
        }
    }
    
  //function to get the winner for a game
    func getWinningPlayer(for game: Game) -> GamePlayer? {
        // Return nil if there are no players
        if game.players.isEmpty {
            return nil
        }
        // Determine winner based on highestWins flag
        if game.highestWins == true {
            return game.players.max { $0.playerScore < $1.playerScore }
        } else {
            return game.players.min { $0.playerScore < $1.playerScore }
        }
    }
    
}
