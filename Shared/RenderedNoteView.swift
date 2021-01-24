//
//  RenderedNoteView.swift
//  SimpleNotes
//
//  Created by Jack McCracken on 2021-01-23.
//

import SwiftUI
import Down
import AttributedText

struct RenderedNoteView: View {
    var text: Binding<String>?

    var body: some View {
        if let text = text {
            let down = Down(markdownString: text.wrappedValue)
            let attributedStringDown = try! down.toAttributedString()
            ScrollView {
                AttributedText(attributedStringDown)
            }
        }
        else {
            Text("Select a note to begin!")
        }
    }
}
