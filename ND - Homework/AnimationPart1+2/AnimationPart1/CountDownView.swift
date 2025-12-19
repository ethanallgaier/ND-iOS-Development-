//
//  CountDownView.swift
//  AnimationPart1
//
//  Created by Ethan Allgaier on 12/8/25.
//

import SwiftUI



struct CountdownView: View {
    @State private var countdown = 3
    @State private var showNumber = false
    @State private var started = false
    @State private var finished = false

    var body: some View {
        VStack(spacing: 40) {

            if started {
                if finished {
                    Text("GO!")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundStyle(.green)
                } else if showNumber {
                    Text("\(countdown)")
                        .font(.system(size: 80, weight: .bold))
                        .scaleEffect(showNumber ? 1 : 2)
                        .opacity(showNumber ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: showNumber)
                        .transition(.opacity) // fade out only
                }
            }

            if !started {
                Button("Start Game") {
                    started = true
                    startCountdown()
                }
                .font(.title2)
            }
        }
    }

    func startCountdown() {
        showNumber = true

        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            withAnimation {
                showNumber = false
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if countdown > 1 {
                    countdown -= 1
                    withAnimation {
                        showNumber = true
                    }
                } else {
                    timer.invalidate()
                    finished = true
                }
            }
        }
    }
}

//
//#Preview {
//    CountdownView()
//}
