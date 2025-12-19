//
//  ContentView.swift
//  AnimationPart1
//
//  Created by Ethan Allgaier on 12/8/25.
//

import SwiftUI

@Observable
class contentViewModel {
    var hideNumber: Bool = false
    var countdownIndex = -1
    
}

struct AnimationViewModel: View {
    
    
    @Namespace private var animation// animation key
    @State var isVisible: Bool = false
    
    @State var viewModel = contentViewModel()// getting info from contentViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            ZStack {
                
                if viewModel.countdownIndex == 3 {
                    Text("3")
                        .font(.system(size: 80, weight: .bold))
                        .transition(.asymmetric(
                            insertion: .scale,
                            removal: .opacity
                        ))
                }
                
                if viewModel.countdownIndex == 2 {
                    Text("2")
                        .font(.system(size: 80, weight: .bold))
                        .transition(.asymmetric(
                            insertion: .scale,
                            removal: .opacity
                        ))
                }
                if viewModel.countdownIndex == 1 {
                    Text("1")
                        .font(.system(size: 80, weight: .bold))
                        .transition(.asymmetric(
                            insertion: .scale,
                            removal: .opacity
                        ))
                }
                if viewModel.countdownIndex == 0 {
                    Text("GO!")
                        .font(.system(size: 100, weight: .bold))
                        .transition(.asymmetric(
                            insertion: .scale,
                            removal: .opacity
                        ))
                }
            }
            Spacer()
            ZStack {
                if viewModel.countdownIndex == 3 {
                    Image(systemName: "hare")
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: "icon", in: animation)
                        .frame(width: 30, height: 30)
                    
                }else if viewModel.countdownIndex == 2 {
                    Image(systemName: "hare")
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: "icon", in: animation)
                        .frame(width: 50, height: 50)
                    
                } else if viewModel.countdownIndex == 1 {
                    Image(systemName: "hare")
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: "icon", in: animation)
                        .frame(width: 70, height: 70)
                    
                } else if viewModel.countdownIndex == 0 {
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: "icon", in: animation)
                        .frame(width: 100, height: 100)
                }
            }
            .frame(height: 100)
            
            
            Button("START GAME!") {
                startCountdown()
                isVisible.toggle()
            }
            .frame(width: 200, height: 70)
            .foregroundStyle(Color(.black))
            .background(Color(.secondarySystemBackground))
            .cornerRadius(22)
            
        }
//        .onTapGesture {
//            withAnimation {
//                isVisible.toggle()
//            }
//        }
    }
        
    
    
    func startCountdown() {
        viewModel.countdownIndex = 3
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { timer in
            withAnimation(.easeInOut(duration: 0.5)) { // animation when func is called(how number goes away)
                viewModel.countdownIndex -= 1
            }
            
            
            if viewModel.countdownIndex < 0 {
                timer.invalidate()
                viewModel.countdownIndex = 0  // Keep GO! visible
            }
        }
    }
}



#Preview {
    AnimationViewModel()
}
//You have been hired by a game company to create a countdown animation for their app.

//Specific Requirements:

//Animation should not start till “Start Game” is tapped
//Each number should scale down and fade in at the same time.

//When animating a number away, the number should only fade out. No scaling.

//The final phase of the animation(“GO!”) should stay on the screen.
