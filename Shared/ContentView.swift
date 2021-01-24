//
//  ContentView.swift
//  Shared
//
//  Created by Jack McCracken on 2021-01-23.
//

import SwiftUI
import CoreData
import LoremSwiftum

struct ContentView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.created_at, ascending: true)],
        animation: .default)
    private var notes: FetchedResults<Note>
    @Environment(\.managedObjectContext) private var viewContext
    @State private var currentNote : Note?
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        let nonOptionalNoteBinding = Binding<Note>($currentNote)
        
        NavigationView {
            NoteListView(notes: notes, currentNote: $currentNote)
            MarkdownView(text: nonOptionalNoteBinding?.text, title: nonOptionalNoteBinding?.title)
            RenderedNoteView(text: nonOptionalNoteBinding?.text)
        }.onReceive(timer) { time in
            try! self.viewContext.save()
        }
    }
}

private let noteFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
