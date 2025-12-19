//
//  TabView.swift
//  RandomAPI
//
//  Created by Ethan Allgaier on 12/7/25.
//

import SwiftUI



    struct RootView: View {
        var body: some View {
            TabView {
                
                DogView()
                    .tabItem {
                        Label("Dogs", systemImage: "pawprint.fill")
                    }

                RepresentativeView()
                    .tabItem {
                        Label("Reps", systemImage: "person.fill")
                    }
            }
        }
    }


#Preview {
    RootView()
}
