////
////  fun.swift
////  Game1
////
////  Created by Ethan Allgaier on 12/12/25.
////
//
//import SwiftUI
//import SwiftData
//
//
//
//
//
//
//// MARK: - Single Card View
//struct GameCardView: View {
//    let game: Game
//    let visualIndex: Int
//    let dragOffset: CGSize
//    let signedProgress: Double
//    let progress: Double
//    let width: CGFloat
//    let gamesCount: Int
//    
//    var body: some View {
//        RoundedRectangle(cornerRadius: 16)
//            .fill(Color.blue.gradient)
//            .frame(width: width, height: 250)
//            .overlay(
//                ZStack {
//                    // Main content in center
//                    VStack(spacing: 10) {
//                        Text(game.gameTitle)
//                            .font(.title2)
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                        
//                       
//                            Text("Current Winner: ")
//                                .font(.caption)
//                                .foregroundColor(.white.opacity(0.8))
//                               
//
//                        Image(systemName: game.gameIcon)
//                            .font(.system(size: 50))
//                            .foregroundColor(.white)
//                            
//                    }
//                    .padding()
//
//                    // Button in top-right
//                    VStack {
//                        HStack {
//                            Spacer()
//                            NavigationLink(destination: ScoreBoardView()) {
//                                Image(systemName: "info.circle")
//                                    .font(.title2)
//                                    .foregroundColor(.white)
//                                    .padding(8)
//                            }
//                        }
//                        Spacer()
//                    }
//                    .padding(8)
//                }
//            )
//
//            .shadow(radius: 5)
//            // ✅ restored original animation math
//            .offset(
//                x: visualIndex == 0 ? dragOffset.width : Double(visualIndex) * 10,
//                y: visualIndex == 0 ? 0 : Double(visualIndex) * -4
//            )
//            .zIndex(Double(gamesCount - visualIndex)) // original zIndex logic
//            .rotationEffect(.degrees(
//                visualIndex == 0 ? 0 : Double(visualIndex) * 3 - progress * 3
//            ), anchor: .bottom)
//            .scaleEffect(
//                visualIndex == 0 ? 1.0 :
//                visualIndex == 1
//                ? (1.0 - Double(visualIndex) * 0.06 + progress * 0.06)
//                : (1.0 - Double(visualIndex) * 0.06)
//            )
//            .rotation3DEffect(.degrees(
//                (visualIndex == 0 || visualIndex == 1) ? 10 * signedProgress : 0
//            ), axis: (0,1,0))
//    }
//}
//
//// MARK: - Card Stack
//struct GameCard: View {
//    @Binding var games: [Game]
//    @State private var topCardIndex: Int = 0
//    @GestureState private var dragOffset: CGSize = .zero
//    
//    var width: CGFloat = 180
//    
//    var body: some View {
//        ZStack {
//            if games.isEmpty {
//                Text("No games 😔")
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(.white)
//                    .font(.title2)
//            } else {
//                ForEach(games.indices, id: \.self) { index in
//                    let visualIndex = (index - topCardIndex + games.count) % games.count
//                    let progress = min(abs(dragOffset.width) / 150, 1)
//                    let signedProgress = (dragOffset.width >= 0 ? 1 : -1) * progress
//                    
//                    GameCardView(
//                        game: games[index],
//                        visualIndex: visualIndex,
//                        dragOffset: dragOffset,
//                        signedProgress: signedProgress,
//                        progress: progress,
//                        width: width,
//                        gamesCount: games.count
//                    )
//                }
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.black)
//        .gesture(
//            DragGesture()
//                .updating($dragOffset) { value, state, _ in
//                    state = value.translation
//                }
//                .onEnded { value in
//                    if abs(value.translation.width) > 100 && !games.isEmpty {
//                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
//                            topCardIndex = (topCardIndex + 1) % games.count
//                        }
//                    }
//                }
//        )
//    }
//}
//
//
//
//
//// MARK: - Preview
//#Preview {
//    struct PreviewWrapper: View {
//        @State private var games: [Game] = [
//            Game(gameTitle: "Chess", players: [], gameIcon: "checkerboard.rectangle"),
//            Game(gameTitle: "Sudoku", players: [], gameIcon: "square.grid.3x3"),
//            Game(gameTitle: "Tetris", players: [], gameIcon: "t.square")
//        ]
//        var body: some View {
//            GameCard(games: $games)
//        }
//    }
//    return PreviewWrapper()
//        .modelContainer(for: Game.self)
//}
