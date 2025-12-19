//
//  fun.swift
//  GamesTracker
//
//  Created by Ethan Allgaier on 12/11/25.
//

import SwiftUI

struct CardData: Identifiable {
    let id = UUID()
    let color: Color
    let title: String
}

struct ContentView: View {
    @State private var topCardIndex: Int = 0
    @GestureState private var dragOffset: CGSize = .zero
    
    var width: CGFloat = 180
    
    // Sample cards data with colors
    let cards = [
        CardData(color: .blue, title: "Fortnite"),
        CardData(color: .green, title: "Red dead Redemption"),
        CardData(color: .orange, title: "Cod"),
        CardData(color: .purple, title: ""),
        CardData(color: .pink, title: "")
    ]
    
    var body: some View {
        
        ZStack {
            ForEach(cards.indices, id: \.self) { index in
                let visualIndex = (index - topCardIndex + cards.count) % cards.count
                let progress = min(abs(dragOffset.width) / 150, 1)
                let signedProgress = (dragOffset.width >= 0 ? 1 : -1) * progress
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(cards[index].color.gradient)
                    .frame(width: width, height: 250)
                    .overlay(
                        Text(cards[index].title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    )
                    .shadow(radius: 5)
                    .offset(
                        x: visualIndex == 0 ? dragOffset.width : Double(visualIndex) * 10,
                        y: visualIndex == 0 ? 0 : Double(visualIndex) * -4
                    )
                    .zIndex(Double(cards.count - visualIndex))
                    .rotationEffect(
                        .degrees(visualIndex == 0 ? 0 : Double(visualIndex) * 3 - progress * 3),
                        anchor: .bottom
                    )
                    .scaleEffect(
                        visualIndex == 0 ? 1.0 : visualIndex == 1
                        ? (1.0 - Double(visualIndex) * 0.06 + progress * 0.06)
                        : (1.0 - Double(visualIndex) * 0.06)
                    )
                    .offset(x: visualIndex == 0 ? 0 : Double(visualIndex) * -3)
                    .rotation3DEffect(
                        .degrees(
                            (visualIndex == 0 || visualIndex == 1) ? 10 * signedProgress : 0
                        ),
                        axis: (0, 1, 0)
                    )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation
                }
                .onEnded { value in
                    let threshold: CGFloat = 100
                    if abs(value.translation.width) > threshold {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            topCardIndex = (topCardIndex + 1) % cards.count
                        }
                    }
                }
        )
    }
}

#Preview {
    ContentView()
}
