import SwiftUI
import SwiftData

struct EditGameView: View {
    // MARK: - Environment
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    // MARK: - Input
    let game: Game
    
    @State var viewModel = NewGameViewModel()

 
    @State private var gameTitle: String = ""
    @State private var gameIcon: String = ""
    @State private var highestWins: Bool = true
    @State private var sortByHighestScore: Bool = true
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Game Details") {
                    TextField("Game Title", text: $gameTitle)
                    
                    Picker("Change Game Icon:", selection: $gameIcon) {
                        ForEach(viewModel.sfSymbols, id: \.self) { icon in
                            Label(icon, systemImage: icon)
                                .tag(icon)
                        }
                    }
                    
                    // Pr
                }
                Section("Game Settings") {
                    Picker("Who Wins?", selection: $highestWins) {
                        Text("Highest Score").tag(true)
                        
                        Text("Lowest Score").tag(false)
                    }
                    Picker("Sort Player by:", selection: $sortByHighestScore) {
                        Text("Highest Score").tag(true)
                        Text("Lowest Score").tag(false)
                    }
                }
               
            }
            .navigationTitle("Edit Game")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveChanges()
                        dismiss()
                    }
                    .disabled(gameTitle.isEmpty)
                }
            }
            .onAppear {
                // Load current game data when view appears
                loadGameData()
            }
        }
    }
    
    // MARK: - Helper Functions
    
    /// Loads the current game data into state variables
    private func loadGameData() {
        gameTitle = game.gameTitle
        gameIcon = game.gameIcon
        highestWins = game.highestWins
        sortByHighestScore = game.sortByHighestScore
    }
    
    /// Saves changes back to the game object
    private func saveChanges() {
        game.gameTitle = gameTitle
        game.gameIcon = gameIcon
        game.highestWins = highestWins
        game.sortByHighestScore = sortByHighestScore
        
        // SwiftData automatically saves changes when you modify the object
        // But you can explicitly save if needed:
        try? modelContext.save()
    }
}

#Preview {
    let player1 = GamePlayer(playerName: "Alice", playerIcon: "person.circle.fill", playerScore: 25)
    let player2 = GamePlayer(playerName: "Bob", playerIcon: "person.circle.fill", playerScore: 40)
    
    let sampleGame = Game(
        gameTitle: "Uno",
        players: [player1, player2],
        gameIcon: "gamecontroller",
        highestWins: true,
        sortByHighestScore: true
    )
    
    EditGameView(game: sampleGame)
        .modelContainer(for: [Game.self, GamePlayer.self], inMemory: true)
}
