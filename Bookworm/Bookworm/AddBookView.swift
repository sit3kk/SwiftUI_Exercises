//
//  AddBookView.swift
//  Bookworm
//
//  Created by Konrad Sitek on 13/01/2024.
//

import SwiftUI


struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
       
    var dateAdded = Date()
   
    
    var body: some View {
        NavigationView {
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
                Section {
                    Picker("Rating", selection: $rating) {
                        ForEach(0..<6) {
                            Text("\($0)")
                        }
                    }
                    RatingView(rating: $rating)
                    TextField("Write a review", text: $review)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: self.moc)
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        newBook.genre = self.genre
                        newBook.review = self.review
                        newBook.dateAdded = self.dateAdded
                                                
                        self.presentationMode.wrappedValue.dismiss()
                    }
                        .disabled(self.genre.isEmpty)
                }
                
            }
            .navigationBarTitle("Add Book")
        }
        
        
    }
}
