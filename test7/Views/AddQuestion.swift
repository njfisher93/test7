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
    @State private var answers = [""]
    
    var body: some View {
    
        VStack {
            
            Text("Add Questions")
            
            HStack {
                Text("Question: ")
                    .bold()
                TextField("What is the mechanism of action of lasix?", text: $stem)
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
