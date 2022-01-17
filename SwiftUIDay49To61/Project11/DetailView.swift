//
//  DetailView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 12/01/2022.
//
import CoreData
import SwiftUI

struct DetailView: View {
    
    let book: Book
    
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding()
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknown author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            
            Spacer()
            Spacer()
            Spacer()
            
            Text(book.date?.formatted() ?? "Unknown date")
        }
        .navigationTitle(book.title ?? "Unknown book")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive ,action: deleteBook)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure?")
        }
    }
    
    private func deleteBook() {
        moc.delete(book)
        dismiss()
        
        // not calling .save() because dont want to delete permanently
        // try? moc.save()
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        let context = DataController.shared.container.viewContext
        
        let book = Book(context: context)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.date = Date.now
        book.review = "This was a great book; I really enjoyed it."
        
        return NavigationView {
            DetailView(book: book)
        }.environment(\.managedObjectContext, context)
    }
}
