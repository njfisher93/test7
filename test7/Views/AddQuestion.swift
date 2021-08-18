//
//  AddQuestion.swift
//  test7
//
//  Created by Nolan on 8/13/21.
//

import SwiftUI

struct AddQuestion: View {
    
    @Binding var questions: [QuestionsHold]
    
    @State private var stem = ""
    @State private var explanation = ""
    @State private var correctIndex = 1
    @State private var answerAchoice = ""
    @State private var answerBchoice = ""
    
    var body: some View {
    
        VStack (alignment: .leading) {
            
            Text("Questions")
                .font(.title2)
            
            HStack {
                Text("Question: ")
                    .bold()
                TextField("What is the mechanism of action of lasix?", text: $stem)
            }
            
            HStack {
                Text("A: ")
                    .bold()
                TextField("loop diuretic", text: $answerAchoice)
            }
            
            HStack {
                Text("B: ")
                    .bold()
                TextField("thiazide diuretic", text: $answerBchoice)
            }
            
            HStack {
                Text("Explanation: ")
                    .bold()
                TextField("Lasix is a loop diuretic", text: $explanation)
            }
            
            Button("Add Question") {
            
                
                let q = QuestionsHold()
                q.id = UUID()
                q.stem = stem
                q.explanation = explanation
                q.answerAChoice = answerAchoice
                q.answerBChoice = answerBchoice
                questions.append(q)
                
                stem = ""
                explanation = ""
            }
            
            ForEach(questions) { question in
                Text("\(question.stem)")
            }
            
        }
       

        
    }
}
