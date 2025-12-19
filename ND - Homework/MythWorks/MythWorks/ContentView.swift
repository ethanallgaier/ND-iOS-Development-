//
//  ContentView.swift
//  MythWorks
//
//  Created by Ethan Allgaier on 12/4/25.
//

import SwiftUI

//Main setup
struct ContentView: View {
    
//This controls all navigation
    @State private var router = Router()
    @State private var settings = AppSettings()
    var body: some View {
        
//Manages screen changing
        NavigationStack(path: $router.path) {
             DragonListView()//start with this view
            
// Map each Route case to its corresponding view
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .dragonListView:
                    DragonListView()
                    
                case .dragonDetailView(let dragon):
// Extract the dragon from the route and pass it to the view
                    DragonDetailView(dragon: dragon)
                    
                case .powerListview(let dragon):
 // Extract the dragon from the route and pass it to the view
                    PowerListView(dragon: dragon)
                    
                case .settings:
                    Settings()
                }
            }
        }
// Make router and settings available to ALL views
    .environment(router)
    .environment(settings)
    }
}



#Preview {
    ContentView()
}
