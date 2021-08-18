//
//  AddQuiz.swift
//  test7
//
//  Created by Nolan on 8/13/21.
//

import SwiftUI

struct AddQuiz: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var title = ""
    @State private var author = ""
    @State private var specialty = ""
    @State private var about = ""
    
    
    // This might not be right, refer to RecipeApp
    @State private var questions = [QuestionsHold]()
    
    
    var body: some View {
        
        VStack {
            // Add/clear
            HStack {
                Button("Clear") {
                    // Clear the form
                    title = ""
                    author = ""
                    specialty = ""
                    about = ""
                    questions = [QuestionsHold]()
                }
                
                Spacer()
                
                Button("Add") {
                    // Add the quiz to core data
                    addQuiz()
                    // Clear the form
                    title = ""
                    author = ""
                    specialty = ""
                    about = ""
                }
            }
            .padding()
            
            ScrollView (showsIndicators: false) {
                
                VStack {
                    
                    HStack {
                        Text("Quiz Name: ")
                            .bold()
                        TextField("Heart Failure", text: $title)
                    }
                    
                    
                    HStack {
                        Text("Creator: ")
                            .bold()
                        TextField("John Doe", text: $author)
                    }
                    
                    
                    HStack {
                        Text("Specialty: ")
                            .bold()
                        TextField("Internal Medicine", text: $specialty)
                    }
                    
                    
                    HStack {
                        Text("About: ")
                            .bold()
                        TextField("This quiz covers material relating to...", text: $about)
                    }
                    
                    AddQuestion(questions: $questions)
                }
                .padding(.horizontal)
                
                
            }
            .lineLimit(nil)
        }
        
    }
    
    
    // Must update this if I change the quiz attributes
    func addQuiz() {
        let quiz = Quiz(context: viewContext)
        quiz.id = UUID()
        quiz.title = title
        quiz.specialty = specialty
        quiz.about = about
        quiz.author = author
        
        for q in questions {
            let question = Question(context: viewContext)
            question.id = UUID()
            question.stem = q.stem
            question.answerAChoice = q.answerAChoice
            question.answerBChoice = q.answerBChoice
            question.explanation = q.explanation
            
            quiz.addToQuestions(question)
        }
        do{
            try viewContext.save()
        }
        catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
    }
}
}


