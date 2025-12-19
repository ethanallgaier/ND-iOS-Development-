//
//  GameViewModel.swift
//  GamesTracker
//
//  Created by Ethan Allgaier on 12/10/25.
//
//THIS HOLDS ALL THE DATA FOR THE GAME VIEW(MAIN VIEW OF ALL GAMES)
import SwiftUI
import SwiftData





@Observable
class GameViewModel {
    var showAddSheet = false
    var isEditing: Bool = false
    
    // ADDED: Function to handle game deletion (business logic in ViewModel)
    func deleteGame(at indexSet: IndexSet, from games: [GameInfo], context: ModelContext) {
        indexSet.forEach { index in
            context.delete(games[index])
        }
    }
    
    // Function to toggle sheet 
    func toggleAddSheet() {
        showAddSheet.toggle()
    }
}



