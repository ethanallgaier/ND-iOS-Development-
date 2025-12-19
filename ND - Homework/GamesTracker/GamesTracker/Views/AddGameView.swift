//
//  GameAddView.swift
//  GamesTracker
//
//  Created by Ethan Allgaier on 12/11/25.
//
import SwiftUI
import SwiftData





//THIS IS THE VIEW FOR ADDING A NEW GAME + ADDINGPLAYER + ETC






struct AddGameView: View {
    @Environment(\.dismiss) var dismiss // ALLOWS SCREEN TO CLOSE
    @Environment(\.modelContext) var context // ALLOWS US TO SAVE THINGS INTO SWIFT DATA
    
    @State var viewModel = AddGameViewModel() // GRABBING THE INFO FROM GAMEADDVIEWMODEL
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Game Info") {
                    TextField("Game Title", text: $viewModel.gameTitle)
                    TextField("Player Name", text: $viewModel.player)
                    Picker("Game Icon", selection: $viewModel.icon) {
                        ForEach(viewModel.gameIcons, id:\.self, content: { iconName in
                            Label("", systemImage: iconName).tag(iconName)})
                    }
                    
                }
                
                Section("Game Settings") {
                    Picker("Who Wins?", selection: $viewModel.winCondition) {
                        Text("Highest Score").tag("Highest Score")
                        Text("Lowest Score").tag("Lowest Score")
                    }
                    Picker("Sort Player by:", selection: $viewModel.sortBy) {
                        Text("Highest Score").tag("Highest Score")
                        Text("Lowest Score").tag("Lowest Score")
                    }
                }
            }
            .navigationTitle("Add Game") // TITLE
            .navigationBarTitleDisplayMode(.inline) // TITLE SETTING
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { // BACK BUTTON
                    Button("Cancel") {
                        dismiss() // CLOSES THE SCREEN
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) { // SAVE BUTTON
                    Button("Save") {
                        
                        viewModel.saveGame(context: context) // CALL SAVE FUNC
                        dismiss() // CLOSES THE SCREEN
                    }
                    
                    .disabled(!viewModel.canSave())
                }
            }
        }
    }
}

#Preview {
    AddGameView()
        .modelContainer(for: GameInfo.self)
}
