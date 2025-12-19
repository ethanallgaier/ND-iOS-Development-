//
//  DragonDetailView.swift
//  MythWorks
//
//  Created by Ethan Allgaier on 12/6/25.
//

import SwiftUI

struct DragonDetailView: View {
// This view RECEIVES the dragon that was passed in the route
    let dragon: Dragon
    @Environment(Router.self) private var router
    @Environment(AppSettings.self) private var settings
    var body: some View {
        ZStack {
            settings.backgroundColor.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    Image(dragon.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .clipped()
                        .shadow(radius: 10)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                    Spacer()
                    Divider()
                        .frame(width: 350)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Species" )
                            .font(.title3)
                            .bold()
                        Text("\(dragon.species)")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    Text("Fire Power")
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    Text(String(repeating: "🔥", count: dragon.fireRating))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Lore")
                            .font(.title3)
                            .bold()
                        Text("\(dragon.lore)")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    Spacer()
                    Button(action: {
                        
                        router.navigate(to: .powerListview(dragon: dragon))
                    }) {
                        Text("Power List")
                            .frame(width: 320)
                            .bold()
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            
                            .cornerRadius(12)
                            .foregroundStyle(Color.blue)
                        
                    }
                    
                
                .navigationTitle(dragon.name)
                .navigationBarTitleDisplayMode(.inline)

                }
            }
        }
    }
}
