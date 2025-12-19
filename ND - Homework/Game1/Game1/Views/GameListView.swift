//
//  GameList.swift
//  Game1
//
//  Created by Ethan Allgaier on 12/11/25.
//

import SwiftUI
import SwiftData

struct GameListView: View {
    
  
    @Environment(\.modelContext) var context // SwiftData context
    @Query(sort: \Game.order) var games: [Game]  // SwiftData auto-fetch

    @State var viewModel: GameListViewModel = .init()
    @State private var editMode: EditMode = .inactive
    
    @State var isExpanded: Bool = false
    @Namespace private var animation
    @State private var rotation: Double = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color.secondary.opacity(0.2)
                    .ignoresSafeArea()
                
//list
                List {
                    ForEach(games) { game in
                        NavigationLink {
                            ScoreBoardView(game: game)
                        } label: {
                            HStack(spacing: 12) {
                                Image(systemName: game.gameIcon)//Game icon
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .rotationEffect(.degrees(rotation))
                                    .onTapGesture {
                                        withAnimation {
                                            rotation += 360
                                        }
                                    }
                                
                                VStack(alignment: .leading) {
                                    Text(game.gameTitle)// Game Title
                                        .font(.custom("Cochin", size: 40))
                                        .matchedGeometryEffect(id: "title-\(game.id)", in: animation)
                                    
                                    Spacer()
                                    //finding the current winner of a game
                                    if let winner = viewModel.getWinningPlayer(for: game) {
                                        Text("Current winner:    \(winner.playerName)")
                                            .font(.custom("Cochin", size: 20))
                                            .foregroundStyle(Color(.secondaryLabel))

                                    } else {
                                        Text("No one")
                                            .foregroundStyle(Color(.secondaryLabel))
                                            .font(.custom("Cochin", size: 20))
                                        
                                    }
                                
                                        
                                    Spacer()
                                }
                            }
                        }
                       
                    }
                    //Reorganizing
                    .onMove { from, to in
                        var reordered = games
                        reordered.move(fromOffsets: from, toOffset: to)

                        for (index, game) in reordered.enumerated() {
                            game.order = index
                        }
                    }
                    
                    // Delete games
                    .onDelete { indexSet in
                        viewModel.deleteGame(
                            at: indexSet,
                            from: games,
                            context: context
                        )
                        for(index, game) in games.enumerated() {
                            game.order = index
                        }
                    }
                }
                
                .scrollContentBackground(.hidden)
                
            }
            
            .navigationTitle("Games")
            
            .toolbar {
                // Edit button
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        viewModel.isEditing.toggle()
                        
                        editMode = viewModel.isEditing ? .active : .inactive
                    } label: {
                        if viewModel.isEditing {
                            Image(systemName: "checkmark")
                        } else {
                            Text("Edit")
                                .font(.custom("Cochin", size: 20))
                        }
                    }
                }
                
                // Add game button
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.showAddGame.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            .environment(\.editMode, $editMode)//ALLOWS EDITING
        
            .sheet(isPresented: $viewModel.showAddGame) {//Allows newGameView to be accessed
                NewGameView()
            }
        }
    }
}




#Preview {
    GameListView()
        .modelContainer(for: Game.self)
}
