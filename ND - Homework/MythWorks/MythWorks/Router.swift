//
//  Router.swift
//  MythWorks
//
//  Created by Ethan Allgaier on 12/5/25.
//

import SwiftUI


// router enum
// All possible destinations (routes)
// Define all screens
enum Route: Hashable {
    case dragonListView
    case dragonDetailView(dragon: Dragon)// needs to know what dragon
    case powerListview(dragon: Dragon)// needs to know what dragon
    case settings
}



//router class
//Controls where the user goes in the app
@Observable
class Router {
    var path = NavigationPath()
    
//Navigates to a new screen
    func navigate(to route: Route) {
        path.append(route)
    }
    
// Go back one screen
// Like pressing the back button
    func navigateBack() {
        path.removeLast()  // Remove the most recent screen
    }
    
// Go all the way back to the first screen (empties the entire stack)
// Like pressing "Home" to reset everything
    func navigateToRoot() {
        path.removeLast(path.count)  // Remove ALL screens except the root
    }
}
