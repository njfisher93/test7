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
                
                ForEach (quiz.questions!.allObjects as! [Question]) { index in
                    
                    if index.questionAnswered == true {
                        
                        // Question submitted, show explanation
                        VStack {
                            Text(index.stem ?? "")
                            Text(index.explanation ?? "")
                        }
                        
                    }
                    else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.gray)
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
                                        Text(index.answerAChoice ?? "no choice")
                                            .font(.body)
                                    }
                                    else {
                                        Text(index.explanation ?? "")
                                    }
                                    
                                }
                                .onChange(of: totalAnswered) { newState in
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
                                        Text(index.answerBChoice ?? "no choice")
                                            .font(.body)
                                    }
                                    else {
                                    
                                    }
                                }
                            }
                        }
                        
                        }
                    }
                    
                }
                
            }
        }
    }








