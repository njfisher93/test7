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
        
            Text(quiz.specialty ?? "")
                .fontWeight(.light)
            
            Text("By: \(quiz.author ?? "")")
                .fontWeight(.ultraLight)
            
            Text(quiz.about ?? "")
                .padding(.vertical, 20)

            
            Spacer()
            
            
            Button(action: {
                isShowingQuiz.toggle()
            }) {
                ZStack (alignment: .center){
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.green)
                        .opacity(0.5)
                        .aspectRatio(CGSize(width: 335, height: 100), contentMode: .fit)
                        
                    Text("Start Quiz")
                        .foregroundColor(.black)
                        .font(.title)
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
        
        
    }
        .padding()
        
}
    func didDismiss() {
        //Dismissing action
    }
}

