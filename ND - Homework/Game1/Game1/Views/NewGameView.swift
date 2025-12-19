//
//  NewGameView.swift
//  Game1
//
//  Created by Ethan Allgaier on 12/11/25.
//

import SwiftUI
import SwiftData

struct NewGameView: View {
    // MARK: - Environment
    @Environment(\.modelContext) var context    // Gives us the tool we need to add or remove saved data.
    @Environment(\.dismiss) var dismiss// Close screen
    // MARK: - State
    @State var viewModel: NewGameViewModel = .init()     // Grabbing data from viewModel
    @State var showAlert = false // Controls if newplayer popup shows .alert
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color.secondary.opacity(0.1)
                    .ignoresSafeArea()
                
                // Form layer
                Form {
                    //Game info
                    Section("Game Info") {
                        TextField("Enter Game Title", text: $viewModel.title)
                            

                        Picker("Choose Game icon:", selection: $viewModel.gameIcon) {
                            ForEach(viewModel.sfSymbols, id: \.self) { icon in
                                Label(icon, systemImage: icon)
                                    .tag(icon)
                            }
                        }
                    }
                    
                    //Game Settings
                    Section("Game Settings") {
                        Picker("Who Wins?", selection: $viewModel.highestWins) {
                            Text("Highest Score").tag(true)
                            
                            Text("Lowest Score").tag(false)
                        }
                        Picker("Sort Player by:", selection: $viewModel.sortByHighestScore) {
                            Text("Highest Score").tag(true)
                            Text("Lowest Score").tag(false)
                        }
                    }
                    
                    //add player
                    Section("Players") {
                        HStack {
                            Spacer()
                            Button("Add player") {
                                showAlert.toggle()
                            }
                            Spacer()
                        }
                        .alert("Enter Name", isPresented: $showAlert) {
                            TextField(" Player name", text: $viewModel.playerName)
                            Button("Cancel", role: .cancel) { }
                            Button("OK") {
                                viewModel.addPlayer(context: context)
                                print("Entered: \(viewModel.playerName)")
                            }
                        }
                    }
                    
                    //Player list
                    Section("Player list") {
                        ForEach(viewModel.players) { player in
                            HStack {
                                Image(systemName: player.playerIcon)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding()
                                VStack(alignment: .leading) {
                                    Text(player.playerName)
                                    Text("Current score: \(player.playerScore)")
                                        .foregroundStyle(Color(.secondaryLabel))
                                }
                            }
                        }//delete players
                        .onDelete { offsets in
                            viewModel.deletePlayer(at: offsets, context: context)
                        }
                    }
                }//background
                .scrollContentBackground(.hidden)
            }
            .environment(\.font, .custom("Cochin", size: 18))//font
            .navigationTitle("New Game")//title
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {//cancel button
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {//save/complete button
                        viewModel.saveGame(context: context)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }
    }

#Preview {
    NewGameView()
        .modelContainer(for: [Game.self, GamePlayer.self], inMemory: true)
}
