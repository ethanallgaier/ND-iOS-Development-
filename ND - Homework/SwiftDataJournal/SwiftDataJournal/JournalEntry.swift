//
//  JournalEntry.swift
//  SwiftDataJournal
//
//  Created by Ethan Allgaier on 12/2/25.
//

import SwiftUI
import SwiftData

@Model
class JournalEntry {
    var title: String
    var body: String
    var createdDate: Date
    @Relationship(deleteRule: .cascade) var noteEntry: [NoteEntry] = []
    
    init(title: String, body: String, createdDate: Date = .now) {
        self.title = title
        self.body = body
        self.createdDate = createdDate
        self.noteEntry = []
    }
}


