//
//  SwiftDataJournalApp.swift
//  SwiftDataJournal
//
//  Created by Ethan Allgaier on 12/2/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataJournalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // This is needed or nothing will load/save.
        .modelContainer(for: [JournalEntry.self, NoteEntry.self])
    }
}


#Preview {
    ContentView()
        .modelContainer(for: [JournalEntry.self, NoteEntry.self])
}
