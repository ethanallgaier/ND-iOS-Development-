//
//  AddNewPlayerView.swift
//  Game1
//
//  Created by Ethan Allgaier on 12/17/25.
//

import SwiftUI
import SwiftData

struct AddNewPlayerView: View {
    
    @State var viewModel: NewGameViewModel = .init()
    // MARK: - Environment
    @Environment(\.modelContext) var context // Tool to save/remove data
    @Environment(\.dismiss) var dismiss     // Close screen
    
    let game: Game// pass in the current game
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.secondary.opacity(0.2)
                    .ignoresSafeArea()
            VStack(spacing: 20) { // Added VStack to properly contain TextField and spacing
                Spacer()
                TextField("Enter Player Name", text: $viewModel.playerName)
                    .font(.custom("Bodoni 72", size: 40))
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    .frame(width: 370)
                Spacer()
            }
            
           
            
            .navigationTitle("Add New Player")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                //cancel button
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()//close screen
                    } label: {
                        Image(systemName: "arrow.backward")
                            .padding()
                    }
                }
                ToolbarItem(placement: .automatic) {
                    Button{
                        viewModel.addAdditionalPlayer(to: game, context: context) // Save player
                        dismiss()
                    }label: {
                        Image(systemName: "checkmark")
                            .padding()
                    }
                }
                }
            }
        }
    }
}

#Preview {
    // Create a sample Game for preview
    let sampleGame = Game(
        gameTitle: "Sample Game",
        players: [],
        gameIcon: "gamecontroller",
        highestWins: true,
        sortByHighestScore: true
    )

    AddNewPlayerView(game: sampleGame)
        .modelContainer(for: [Game.self, GamePlayer.self], inMemory: true)
}

