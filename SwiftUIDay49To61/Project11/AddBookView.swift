//
//  AddBookView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 10/01/2022.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var moc
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    private var disabledSaveBtn: Bool {
        genre.trimmingCharacters(in: .whitespaces).isEmpty || title.trimmingCharacters(in: .whitespaces).isEmpty || author.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button("Save", action: saveNewBook)
                }.disabled(disabledSaveBtn)
            }
            .navigationTitle("Add book")
        }
    }
    
    private func saveNewBook() {
        
        let newBook = Book(context: moc)
        newBook.id = UUID()
        newBook.genre = genre
        newBook.title = title
        newBook.author = author
        newBook.rating = Int16(rating)
        newBook.review = review
        newBook.date = Date.now
        
        if moc.hasChanges {
            try? moc.save()
        }
        dismiss()
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
