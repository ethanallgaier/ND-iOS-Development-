//
//  ScoreBoardView.swift
//  Game1
//
//  Created by Ethan Allgaier on 12/11/25.
//

import SwiftUI
import SwiftData


struct ScoreBoardView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var players: [GamePlayer]
    @State var viewModel: ScoreBoardViewModel = .init()
    
    // For animations
    @Namespace private var animation
    
    let game: Game
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.secondary.opacity(0.2)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // list
                    List {
                        ForEach(
                            viewModel.sortedPlayers(
                                players: game.players,
                                sortByHighestScore: game.sortByHighestScore
                            ),
                            id: \.id
                        ) { player in
                            HStack(spacing: 20) {
                                Image(systemName: player.playerIcon)//player icon
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text(player.playerName)//player name
                                    .font(.custom("Bodoni 72", size: 23))
                                    .padding()
                                
                                Spacer()
                                
                                Stepper(
                                    value: Binding(//stepper
                                        get: { player.playerScore },
                                        set: { newValue in
                                            withAnimation(.smooth) {
                                                player.playerScore = newValue
                                            }
                                        }
                                    ),
                                    in: 0...100//limit
                                ) {
                                    Text("\(player.playerScore)")//player score
                                        .font(.custom("Bodoni 72", size: 20))
                                        .contentTransition(.numericText())
                                }
                            }
                        }
                        .onDelete { offsets in//delete
                            let sorted = viewModel.sortedPlayers(
                                players: game.players,
                                sortByHighestScore: game.sortByHighestScore
                            )
                            
                            for index in offsets {
                                let player = sorted[index]
                                modelContext.delete(player)
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.automatic)
                    
                    // Podium
                    if game.players.count >= 3 {
                        podiumView//top 3 players
                    }
                }
            }
            .navigationTitle("\(game.gameTitle) Scoreboard")//title
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.showAddplayerView.toggle()
                    } label: {
                        Image(systemName: "plus")//add player button
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        viewModel.showEditGameView.toggle()
                    } label: {
                        Image(systemName: "pencil")//edit button
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.showAddplayerView) {
            AddNewPlayerView(game: game)//sheet for adding new player
        }
        .sheet(isPresented: $viewModel.showEditGameView) {
            EditGameView(game: game)//sheet for editing
        }
    }
    
    
    
    //Podium
    var podiumView: some View {
        let top3 = Array(viewModel.sortedPlayers(//top 3 players(most/least amount of points)
            players: game.players,
            sortByHighestScore: game.sortByHighestScore)
            .filter { $0.playerScore > 0 }
        ).prefix(3)
        return HStack(alignment: .bottom) {
            
            //2nd place player
            if top3.count >= 2 {
                VStack {
                    Image(systemName: top3[1].playerIcon)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(top3[1].playerName)
                        .font(.custom("Cochin", size: 30))
                    
                   
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.orange)
                            .frame(width: 110, height: CGFloat(top3[1].playerScore) * 7)

                    
                    Text("\(top3[1].playerScore)")
                        .font(.custom("Cochin", size: 50))
                        .contentTransition(.numericText())
                        
                }
                .matchedGeometryEffect(id: top3[1].id, in: animation)
            }
            
            
            //1st place player
            if top3.count >= 1 {
                VStack {
                    Image(systemName: top3[0].playerIcon)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(top3[0].playerName)
                    
                        .font(.custom("Cochin", size: 30))
                        
                    
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.yellow)
                            .frame(width: 110, height: CGFloat(top3[0].playerScore) * 7)
                        
                    
                    Text("\(top3[0].playerScore)")
                        .font(.custom("Cochin", size: 50))
                        .contentTransition(.numericText())
                }
                .matchedGeometryEffect(id: top3[0].id, in: animation)
            }
            
            
            
            //3rd place player
            if top3.count >= 3 {
                VStack {
                    Image(systemName: top3[2].playerIcon)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(top3[2].playerName)
                        .font(.custom("Cochin", size: 30))
                    
                    
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.red)
                            .frame(width: 110, height: CGFloat(top3[2].playerScore) * 7)
                    
                    Text("\(top3[2].playerScore)")
                        .font(.custom("Cochin", size: 50))
                        .contentTransition(.numericText())
                }
                .matchedGeometryEffect(id: top3[2].id, in: animation)
            }
            
            
            
            
        }
    }
}






#Preview {
    @Previewable @Namespace var namespace
    
    let player1 = GamePlayer(playerName: "Alice", playerIcon: "person.circle.fill", playerScore: 25)
    let player2 = GamePlayer(playerName: "Bob", playerIcon: "person.circle.fill", playerScore: 10)
    let player3 = GamePlayer(playerName: "Charlie", playerIcon: "person.circle.fill", playerScore: 15)
    
    let sampleGame = Game(
        gameTitle: "Uno",
        players: [player1, player2, player3],
        gameIcon: "gamecontroller",
        highestWins: true,
        sortByHighestScore: true
    )
    
    ScoreBoardView(game: sampleGame)
        .modelContainer(for: [Game.self, GamePlayer.self], inMemory: true)
}



























