//
//  NoteEntry.swift
//  SwiftDataJournal
//
//  Created by Ethan Allgaier on 12/4/25.
//

import SwiftUI
import SwiftData

@Model
class NoteEntry {
    var note: String
    var text: String
    
    
    init(note: String, text: String) {
        self.note = note
        self.text = text
    }
}


