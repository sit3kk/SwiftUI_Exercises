//
//  DetailView.swift
//  Bookworm
//
//  Created by Konrad Sitek on 13/01/2024.
//

import SwiftUI
import CoreData

@available(iOS 16.0, *)
struct DetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var dateFormatter: DateFormatter {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.timeStyle = .medium
        return formater
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geometry.size.width)
                    
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                    .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                    .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                
                Text(self.book.author ?? "Unknown author")
                    .font(.title)
                
                Text(self.book.review ?? "No review")
                .padding()
                
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                
                
                HStack {
                    Text("Date added: ")
                        .font(.headline)
                    Text("\(self.book.dateAdded ?? Date(), formatter: self.dateFormatter)")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding(.top, 50)
               
                
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
        .navigationDestination(for: Book.self){ book in
            DetailView(book: book)
        }
        .alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text("Delete book"), message: Text("Are you sure?"),
                primaryButton: .destructive(Text("Delete"), action: deleteBook),
                secondaryButton: .cancel())
        }
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }) {
            Image(systemName: "trash")
        })
    }
    
    func deleteBook() {
        moc.delete(book)
        presentationMode.wrappedValue.dismiss()
    }
}

