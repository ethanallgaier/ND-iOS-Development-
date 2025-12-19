//
//  Example.swift
//  SwiftDataJournal
//
//  Created by Ethan Allgaier on 12/3/25.
//

import SwiftUI
import SwiftData



struct ContentView: View {
    @Environment(\.modelContext) var context

    // REAL persistent storage
    @Query(sort: \JournalEntry.createdDate, order: .reverse)
    private var notes: [JournalEntry]

    @State private var showAddSheet = false

    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        detailJournalEntry(note: note)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .font(.headline)
                            Text(note.body)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Text(note.createdDate, style: .date)
                                .font(.body)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        context.delete(notes[index])
                    }
                }
            }
            .navigationTitle("Journal")
            .toolbar {
                Button {
                    showAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddNewJournal()
            }
        }
    }
}

struct AddNewJournal: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    @State private var title = ""
    @State private var text = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                TextField("Title", text: $title)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)

                TextField("Body", text: $text, axis: .vertical)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    .frame(minHeight: 120)

                Spacer()
            }
            .padding()
            .navigationTitle("Add Note")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newEntry = JournalEntry(title: title, body: text)
                        context.insert(newEntry)
                        dismiss()
                    }
                }
            }
        }
    }
}



struct detailJournalEntry: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context

    @Bindable var note: JournalEntry
    @State private var showAddSheet = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                TextField("Title", text: $note.title)
//                    .padding()
//                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    .font(.title2.bold())
                    

                TextField("Body", text: $note.body)
//                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    

                Divider()
                    .background(Color.black)

                List {
                    ForEach(note.noteEntry) { entry in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(entry.note)
                                .font(.headline)

                            Text(entry.text)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 6)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)

                Spacer()
            }
            .padding()
            .navigationTitle(note.createdDate.formatted(date: .numeric, time: .omitted))
            .toolbar {
                Button {
                    showAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddNewNote(parentNote: note)
            }
        }
    }
}

    
    struct AddNewNote: View {
        @Environment(\.dismiss) var dismiss
        @Environment(\.modelContext) var context
        
        @Bindable var parentNote: JournalEntry
        
        @State private var title: String = ""
        @State private var text: String = ""
        
        var body: some View {
            NavigationView {
                VStack(spacing: 20) {
                    TextField("Title", text: $title)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                        
                    
                    TextField("Body", text: $text, axis: .vertical)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                        .frame(minHeight: 120)
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Add Entry")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Save") {
                            let newEntry = NoteEntry(note: title, text: text)
                            parentNote.noteEntry.append(newEntry)
                            dismiss()// This adds it to the detial journal in the list view
                        }
                    }
                }
            }
        }
    }










#Preview {
    detailJournalEntry(note: JournalEntry(title: "Sample Title", body: "Sample body text"))
        .modelContainer(for: JournalEntry.self)
}





#Preview {
    ContentView()
}
