//
//  GameView.swift
//  GamesTracker
//
//  Created by Ethan Allgaier on 12/10/25.
//

import SwiftUI
import SwiftData




// THIS IS THE MAIN VIEW LIST OF ALL GAMES + ADD BUTTON + EDIT)







//MAINVIEW
struct GameView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \GameInfo.order) var games: [GameInfo] // THIS MAKES SURE MY LIST UPDATES// and the order
    
    @State var viewModel = GameViewModel()// GRABS DATA FROM VIEW MODEL
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(games) { game in
                    HStack {
                        Image(systemName: game.icon)
                        
                        Text("\(game.title)")
                            .padding()
                        Text("Current Winner: \(game.currentWinner ?? game.player)")
                    }
                }
                
                
 //REORGANIZING
                .onMove { from, to in
                    var updated = games
                    updated.move(fromOffsets: from, toOffset: to)
                    // update order numbers
                    for i in updated.indices {
                        updated[i].order = i
                    }
                }
                .onDelete { indexSet in//DELETE GAME-----
                    viewModel.deleteGame(at: indexSet, from: games, context: context)
                }
            }
            .navigationTitle("Games")
            .navigationBarTitleDisplayMode(.automatic)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {// PLUS BAR FOR ADDING NEW GAME
                        viewModel.toggleAddSheet()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .environment(\.editMode, .constant(viewModel.isEditing ? .active : .inactive))//ALLOWS EDITING
            
            
            .toolbar { // EDIT BUTTON
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        viewModel.isEditing.toggle()
                    } label: {
                        if viewModel.isEditing {
                            Image(systemName: "checkmark")
                        } else {
                            Text("Edit")
                        }
                    }
                }
            }
            // SHEET FOR ADDIN NEW GAME
            .sheet(isPresented: $viewModel.showAddSheet) {
                AddGameView()
            }
        }
    }
}
// this should show sf symbol + game title + current winner = all in a list view

#Preview {
    GameView()
        .modelContainer(for: GameInfo.self)
}



//#Preview {
//    GameCard(onSelect: {} )
//}
// view should have textfirld for game title + button for adding players + save button + sort by player notch thing +who wins notch( highest score or lowest score) + Bonus add a thing where you can select a sf symbol for your game



////LAYOUT FOR EACH CALENDER DATE//DESIGN
//struct GameCard: View {
//    let onSelect: () -> Void
//    
//    var body: some View {
//            Button(action: onSelect) {
//                HStack(alignment: .center, spacing: 12) {
//                    Spacer()
//                    // LEFT COLUMN — DATE
//                    Image(systemName: "person")
//                        .foregroundColor(.black)
//                        .font(.system(size: 75))
////                        .fontWidth(.expanded)
////                        .frame(width: 100, height: 105, alignment: .leading)
//                    
//                    Divider()
//                        
//                        .padding()
//                        .frame(width: 2, height: 105)
//                        .background(Color.black)
//                        Spacer()
//                    //RIGHT SIDE
//                    VStack(alignment: .leading) {
//                        Text("Fortnite")
//                            .font(.title)
//                            .foregroundStyle(Color.black)
//                            .padding(.bottom, 20)
//                        Text("Current winner: ")
//                            .font(.subheadline)
//                            .foregroundStyle(Color.secondary)
//
//                        Text("Assignment Due")
//                            .font(.default)
//                            .foregroundStyle(Color.black)
//                        Text("")
//                            .font(.headline)
//                       
//                        
//                    }
//                    .frame(width: 200, alignment: .leading)
//                    .padding(.leading, 4)//SIZE OF RIGHT SIDE -LESSON STUFF
//                    
//                                    
//                                    // ARROW ON THE RIGHT
//                        Image(systemName: "chevron.right")
//                            .foregroundColor(.red)
//                            Spacer()
//                }
//                .frame(width: 375, height: 180)
//                .contentShape(Rectangle())//FOR BOX LAYOUT
//            }
//            .buttonStyle(PlainButtonStyle())
//            .glassEffect(.clear, in: .rect(cornerRadius: 20.0))
//            .buttonBorderShape(.roundedRectangle(radius: 20))
//            
//            .overlay(
//                    RoundedRectangle(cornerRadius: 12)  // how round the corners are
//                        .stroke(Color.black, lineWidth: 0.9) // border color & thickness
//                )
//        }
//    }
