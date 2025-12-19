//
//  GamesTrackerApp.swift
//  GamesTracker
//
//  Created by Ethan Allgaier on 12/10/25.
//

import SwiftUI
import SwiftData

@main
  struct GamesTrackerApp: App {
      var body: some Scene {
          WindowGroup {
              GameView()
          }
          .modelContainer(for: GameInfo.self)
      }
  }
