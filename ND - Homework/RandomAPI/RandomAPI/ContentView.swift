//
//  ContentView.swift
//  RandomAPI
//
//  Created by Ethan Allgaier on 11/28/25.
//

import SwiftUI
import SwiftData

@main
struct RandomAPIView: App {
        var body: some Scene {
            WindowGroup {
                RootView()
            }
            .modelContainer(for: Dog.self)
        }
    }

