//
//  QuizDescriptionView.swift
//  test7
//
//  Created by Nolan on 8/13/21.
//

import SwiftUI

struct QuizDescriptionView: View {
    
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
        }
        .padding(.horizontal)
        
    }
}

