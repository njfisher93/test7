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
    @State private var answerCchoice = ""
    @State private var answerDchoice = ""
    @State private var answerEchoice = ""
    
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
                Text("C: ")
                    .bold()
                TextField("ACE-i", text: $answerCchoice)
            }
            
            HStack {
                Text("D: ")
                    .bold()
                TextField("ARB", text: $answerDchoice)
            }
            
            HStack {
                Text("E: ")
                    .bold()
                TextField("CCB", text: $answerEchoice)
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
                q.answerCChoice = answerCchoice
                q.answerDChoice = answerDchoice
                q.answerEChoice = answerEchoice
                questions.append(q)
                
                stem = ""
                explanation = ""
                answerAchoice = ""
                answerBchoice = ""
                answerCchoice = ""
                answerDchoice = ""
                answerEchoice = ""
            }
            
            ForEach(questions) { question in
                Text("\(question.stem)")
            }
            
        }
       

        
    }
}
