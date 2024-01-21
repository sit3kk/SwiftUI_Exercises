//
//  AddBookView.swift
//  Bookworm
//
//  Created by Konrad Sitek on 21/01/2024.
//

import SwiftUI

struct AddBookView: View {
    // @Environment is a property wrapper that allows access to shared data from SwiftUI's environment.
    // .modelContext might be a custom environment property for data handling (e.g., Core Data context).
    @Environment(\.modelContext) var modelContext

    // @Environment property for handling the dismissal of the view.
    @Environment(\.dismiss) var dismiss

    // @State properties are used to track changes in the UI.
    // These are private to AddBookView and will cause the view to re-render when changed.
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""

    // A constant array of genre options.
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }

                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }.disabled(title.isEmpty || author.isEmpty || genre.isEmpty)
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
