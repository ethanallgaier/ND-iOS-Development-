//
//  Game1App.swift
//  Game1
//
//  Created by Ethan Allgaier on 12/11/25.
//

import SwiftUI
import SwiftData

@main
struct Game1App: App {
    var body: some Scene {
        WindowGroup {
            GameListView()
            
            
        }
        .modelContainer(for: [Game.self, GamePlayer.self])
//        .modelContainer(for: Game.self) need this for saving data
    }
}
