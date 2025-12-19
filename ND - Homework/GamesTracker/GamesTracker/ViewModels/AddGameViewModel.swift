//
//  AddNewGameViewModel.swift
//  GamesTracker
//
//  Created by Ethan Allgaier on 12/11/25.
//

import SwiftUI
import SwiftData





@Observable
class AddGameViewModel {
    var gameTitle: String = ""
    var player: String = ""
    var winCondition: String = "Highest Score"
    var sortBy: String = "Highest Score"
    var icon: String = "gamecontroller.fill"
    
   

    var gameIcons: [String] = [
         "gamecontroller.fill",
         "dice.fill",
         "puzzlepiece.fill",
         "trophy.fill",
         "star.fill",
         "heart.fill"
     ]
    
    // TAKES USER INPUT AND PUTS IT INTO A NEW GAME OBJECT TO SAVE TO SWIFT DATA
    func saveGame(context: ModelContext) {
        // Get the highest order number and add 1
        let existingGames = try? context.fetch(FetchDescriptor<GameInfo>())
        let maxOrder = existingGames?.map { $0.order }.max() ?? -1
        
        let newGame = GameInfo(
            title: gameTitle,
            player: player,
            icon: icon,
            order: maxOrder + 1
        )
        context.insert(newGame)
        try? context.save()
    }
    
    func canSave() -> Bool {
        return !gameTitle.isEmpty && !player.isEmpty
    }
}
