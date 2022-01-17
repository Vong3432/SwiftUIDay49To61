//
//  CoreDataLearningView.swift
//  SwiftUIDay49To61
//
//  Created by Vong Nyuksoon on 08/01/2022.
//

import SwiftUI

struct CoreDataLearningView: View {
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            ForEach(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!

                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
    }
}

struct CoreDataLearningView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataLearningView()
    }
}
