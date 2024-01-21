//
//  Book.swift
//  Bookworm
//
//  Created by Konrad Sitek on 21/01/2024.
//

import Foundation
import SwiftData

@Model  // @Model likely signifies a data model entity, possibly for a database or data management system.
class Book {
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var dateAdded: Date // New property to store the date the book was added.

    init(title: String, author: String, genre: String, review: String, rating: Int, dateAdded: Date = Date.now) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.dateAdded = dateAdded
    }
}
