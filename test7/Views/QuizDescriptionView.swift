//
//  QuizDescriptionView.swift
//  test7
//
//  Created by Nolan on 8/13/21.
//

import SwiftUI

struct QuizDescriptionView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var isShowingQuiz = false
    
    var quiz: Quiz
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            Text(quiz.title ?? "")
                .font(.title)
        
            
            
            Text("By: \(quiz.author ?? "")")
                .fontWeight(.ultraLight)
                
            
        
            
            Text(quiz.specialty ?? "")
                .fontWeight(.light)
                
            
        
            Text(quiz.about ?? "")
                .padding()
            
            Spacer()
            
            
            Button(action: {
                isShowingQuiz.toggle()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.blue)
                    Text("Start Quiz")
                        .foregroundColor(.white)
            }
                .sheet(isPresented: $isShowingQuiz, onDismiss: didDismiss) {
                 QuizView(quiz: quiz)
                }
            
           /* NavigationView {
                NavigationLink(destination: QuizView(quiz: quiz)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.blue)
                        Text("Start Quiz")
                            .foregroundColor(.white)
                    }
            }
                    }*/
                        
                   
                   
            
            
           /* ForEach (quiz.questions!.allObjects as! [Question]) { index in
            
                Text(index.stem ?? "no stem")
                Text(index.answerAChoice ?? "no choice")
                Text(index.answerBChoice ?? "no choice")
            } */
                
        }
        .padding(.horizontal)
        
    }
        
}
    func didDismiss() {
        //Dismissing action
    }
}

