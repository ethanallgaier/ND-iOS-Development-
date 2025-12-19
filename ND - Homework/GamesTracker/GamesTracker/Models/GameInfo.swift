//
//  GameInfo.swift
//  GamesTracker
//
//  Created by Ethan Allgaier on 12/10/25.
//
//HOLDING ALL INFO FOR A GAME

import SwiftUI
import SwiftData

@Model
class GameInfo: Identifiable {
    var id = UUID()
    var title: String
    var player: String
    var iconName: String
    var icon: String
    var score: Int
    var currentWinner: String?
    var order: Int = 0 // for organizing
    
    init(
        id: UUID = UUID(),
        title: String = "",
        player: String = "",
        iconName: String = "",
        icon: String = "",
        score: Int = 0,
        currentWinner: String? = nil,
        order: Int = 0
    ) {
        self.id = id
        self.title = title
        self.player = player
        self.iconName = iconName
        self.icon = icon
        self.score = score
        self.currentWinner = currentWinner
        self.order = order
    }
}
