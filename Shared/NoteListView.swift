//
//  NoteListView.swift
//  SimpleNotes
//
//  Created by Jack McCracken on 2021-01-23.
//

import SwiftUI
import LoremSwiftum

struct NoteListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var notes : FetchedResults<Note>
    var currentNote : Binding<Note?>

    var body: some View {
        List {
            ForEach(notes) { note in
                Button(action: {
                    currentNote.wrappedValue = note
                }) {
                    VStack {
                        Text(note.title)
                    }
                }
            }
            .onDelete(perform: deleteItems)
        }.toolbar {
            #if os(iOS)
            ToolbarItem(placement: .automatic) {
                EditButton()
            }
            #endif
            
            #if os(iOS)
            let placement = ToolbarItemPlacement.bottomBar
            #else
            let placement = ToolbarItemPlacement.automatic
            #endif
            
            ToolbarItem(placement: placement) {
                Button(action: addFolder) {
                    Label("Add Folder", systemImage: "folder.badge.plus")
                }
            }
            ToolbarItem(placement: placement) {
                Spacer()
            }
            ToolbarItem(placement: placement) {
                Button(action: addNote) {
                    Label("Add Note", systemImage: "plus")
                }
            }
        }.navigationTitle("Simple Notes")
    }
    
    private func addNote() {
        withAnimation {
            let newNote = Note(context: viewContext)
            newNote.created_at = Date()
            newNote.updated_at = Date()
            newNote.title = "New Note"
            newNote.text = Lorem.paragraphs(1)
            
            currentNote.wrappedValue = newNote

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func addFolder() {
        
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { notes[$0] }.forEach { (note) in
                if note == currentNote.wrappedValue {
                    currentNote.wrappedValue = notes[0]
                }

                viewContext.delete(note)
            }

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
