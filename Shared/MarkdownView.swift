//
//  NoteView.swift
//  SimpleNotes
//
//  Created by Jack McCracken on 2021-01-23.
//

import SwiftUI
import HighlightedTextEditor

struct MarkdownView: View {
    var text: Binding<String>?
    var title: Binding<String>?

    var body: some View {
        if let text = text, let title = title {
            VStack {
                TextField("Title", text: title)
                HighlightedTextEditor(text: text, highlightRules: .markdown)
            }
        }
        else {
            Text("Select a note to begin!")
        }
    }
}
