//
//  ScoreView.swift
//  GamesTracker
//
//  Created by Ethan Allgaier on 12/11/25.
//

import SwiftUI


// A LIST VIEW OF ALL PLAYERS + SCORES + PLAYERICON IN A GAME







struct ScoreBoardView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("Scoreboard")
            .toolbar {
                
            }
        }
    }
}


#Preview {
    ScoreBoardView()
}
// list of players for the game you selected + stpper for points + player icon + add button top right
// Should be in order from what you selected in game settings
// Should reorder when score changes
