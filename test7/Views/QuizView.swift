//
//  QuizView.swift
//  test7
//
//  Created by Nolan on 8/13/21.
//

import SwiftUI
import CoreData

struct QuizView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var numberCorrect = 0
    @State private var totalAnswered = 0
    
    var quiz: Quiz
    
    var body: some View {
        ScrollView {
            VStack {
                Text(quiz.title ?? "")
                    .font(.title)
                    .foregroundColor(.black)
                
                ForEach (quiz.questions!.allObjects as! [Question]) { index in
                    
                    if index.questionAnswered == true {
                        
                        // Question submitted, show explanation
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.black)
                                .opacity(0.1)
                                .shadow(radius: 4)
                            
                            VStack (alignment: .center){
                                Text(index.stem ?? "")
                                    .bold()
                                    .padding()
                                
                                Text(index.explanation ?? "")
                                    .fontWeight(.ultraLight)
                                    .padding()
                            }
                            .foregroundColor(.black)
                        }
                        .padding()
                        
                        
                        
                    }
                    else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.black)
                                .opacity(0.05)
                                .shadow(radius: 4)
                            VStack {
                                
                                // Question stem
                                Text(index.stem ?? "no stem")
                                    .font(.title2)
                                    .padding()
                                
                                // Answer A button
                                Button {
                                    if index.answerAisCorrect == true {
                                        numberCorrect += 1
                                        totalAnswered += 1
                                        index.questionAnswered = true
                                        
                                    }
                                    else {
                                        totalAnswered += 1
                                        index.questionAnswered = true
                                    }
                                } label: {
                                    
                                    if index.questionAnswered == false {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(.black)
                                                .opacity(0.1)
                                                .shadow(radius: 4)
                                                .padding()
                                                .aspectRatio(CGSize(width: 335, height: 75), contentMode: .fit)
                                            
                                            Text(index.answerAChoice ?? "no choice")
                                                .font(.body)
                                        }
                                    }
                                    else {
                                        Text(index.explanation ?? "")
                                    }
                                    
                                }
                                .onChange(of: totalAnswered) { newState in
                                    
                                    //  Not sure if I need this, but it is meant to refresh the screen after an answer is chosen
                                    Text(index.description)
                                }
                                
                                // Answer B button
                                Button {
                                    if index.answerBisCorrect == true {
                                        numberCorrect += 1
                                        totalAnswered += 1
                                        index.questionAnswered = true
                                    }
                                    else {
                                        index.questionAnswered = true
                                    }
                                } label: {
                                    
                                    if index.questionAnswered == false {
                                        
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(.black)
                                                .opacity(0.1)
                                                .shadow(radius: 4)
                                                .padding()
                                                .aspectRatio(CGSize(width: 335, height: 75), contentMode: .fit)
                                            
                                            Text(index.answerBChoice ?? "no choice")
                                                .font(.body)
                                        }
                                        
                                    }
                                    else {
                                        Text(index.explanation ?? "")
                                    }
                                }.onChange(of: totalAnswered) { newState in
                                    
                                    //  Not sure if I need this, but it is meant to refresh the screen after an answer is chosen
                                    Text(index.description)
                                }
                                
                                // Answer C button
                                Button {
                                    if index.answerCisCorrect == true {
                                        numberCorrect += 1
                                        totalAnswered += 1
                                        index.questionAnswered = true
                                    }
                                    else {
                                        index.questionAnswered = true
                                    }
                                } label: {
                                    
                                    if index.questionAnswered == false {
                                        
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(.black)
                                                .opacity(0.1)
                                                .shadow(radius: 4)
                                                .padding()
                                                .aspectRatio(CGSize(width: 335, height: 75), contentMode: .fit)
                                            
                                            Text(index.answerCChoice ?? "no choice")
                                                .font(.body)
                                        }
                                        
                                    }
                                    else {
                                        Text(index.explanation ?? "")
                                    }
                                }.onChange(of: totalAnswered) { newState in
                                    
                                    //  Not sure if I need this, but it is meant to refresh the screen after an answer is chosen
                                    Text(index.description)
                                }
                                
                                // Answer D button
                                Button {
                                    if index.answerDisCorrect == true {
                                        numberCorrect += 1
                                        totalAnswered += 1
                                        index.questionAnswered = true
                                    }
                                    else {
                                        index.questionAnswered = true
                                    }
                                } label: {
                                    
                                    if index.questionAnswered == false {
                                        
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(.black)
                                                .opacity(0.1)
                                                .shadow(radius: 4)
                                                .padding()
                                                .aspectRatio(CGSize(width: 335, height: 75), contentMode: .fit)
                                            
                                            Text(index.answerDChoice ?? "no choice")
                                                .font(.body)
                                        }
                                        
                                    }
                                    else {
                                        Text(index.explanation ?? "")
                                    }
                                }.onChange(of: totalAnswered) { newState in
                                    
                                    //  Not sure if I need this, but it is meant to refresh the screen after an answer is chosen
                                    Text(index.description)
                                }
                                
                                // Answer E button
                                Button {
                                    if index.answerEisCorrect == true {
                                        numberCorrect += 1
                                        totalAnswered += 1
                                        index.questionAnswered = true
                                    }
                                    else {
                                        index.questionAnswered = true
                                    }
                                } label: {
                                    
                                    if index.questionAnswered == false {
                                        
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(.black)
                                                .opacity(0.1)
                                                .shadow(radius: 4)
                                                .padding()
                                                .aspectRatio(CGSize(width: 335, height: 75), contentMode: .fit)
                                            
                                            Text(index.answerEChoice ?? "no choice")
                                                .font(.body)
                                        }
                                        
                                    }
                                    else {
                                        Text(index.explanation ?? "")
                                    }
                                
                                }.onChange(of: totalAnswered) { newState in
                                    
                                    //  Not sure if I need this, but it is meant to refresh the screen after an answer is chosen
                                    Text(index.description)
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
}



