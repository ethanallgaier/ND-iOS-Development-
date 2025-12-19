//
//  DragonListView.swift
//  MythWorks
//
//  Created by Ethan Allgaier on 12/6/25.
//

import SwiftUI

struct DragonListView: View {
// Get the router from the .environment so we can navigate
    @Environment(Router.self) private var router
    @Environment(AppSettings.self) private var settings
    let dragons = SampleDragonData.dragons
    
    
    var body: some View {
            ZStack {
                settings.backgroundColor.ignoresSafeArea()
                 List {
                    ForEach(dragons) { dragon in
                        Button(action: {
// WHEN TAPPED: Navigate to this dragon's detail screen
//  pass the entire dragon object in the route
                            router.navigate(to: .dragonDetailView(dragon: dragon))
                        }) {
                            
                            HStack(spacing: 15) {
                                //Dragon image
                                Image(dragon.imageName)
                                    .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                // Dragon name and species
                                VStack(alignment: .leading) {
                                    Text(dragon.name)
                                        .font(.headline)
                                        .foregroundStyle(Color(.white))
                                    Text(dragon.species)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Dragons")
            .preferredColorScheme(.dark)

            .toolbar {
//settings gear icon to the top right
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
// When tapped, navigate to settings
                        router.navigate(to: .settings)
                    }) {
                        Image(systemName: "gear")
                    }
                }
            }
        }
    }


