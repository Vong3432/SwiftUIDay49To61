//
//  BookwormAppView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 10/01/2022.
//

import SwiftUI

struct BookwormAppView: View {
    
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author, order: .reverse)
    ]) private var books: FetchedResults<Book>
    
    @State private var showAddingSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                    .foregroundColor( Int(book.rating) == 1 ? .red : .black)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }.onDelete(perform: deleteBooks)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddingSheet.toggle()
                    } label: {
                        Label("Add book", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .navigationTitle("Bookworm")
            .sheet(isPresented: $showAddingSheet) {
                AddBookView()
            }
        }
    }
    
    private func deleteBooks(of offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            
            moc.delete(book)
        }
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
}

struct BookwormAppView_Previews: PreviewProvider {
    static var previews: some View {
        BookwormAppView()
    }
}
