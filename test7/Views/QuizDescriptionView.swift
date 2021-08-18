//
//  QuizDescriptionView.swift
//  test7
//
//  Created by Nolan on 8/13/21.
//

import SwiftUI

struct QuizDescriptionView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
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
            
            ForEach (quiz.questions!.allObjects as! [Question]) { index in
            
                Text(index.stem ?? "no stem")
                Text(index.answerAChoice ?? "no choice")
                Text(index.answerBChoice ?? "no choice")
            }
                
        }
        .padding(.horizontal)
        
    }
}


