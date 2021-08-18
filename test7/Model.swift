//
//  Model.swift
//  test7
//
//  Created by Nolan on 8/13/21.
//

import Foundation

class QuestionsHold: Identifiable, Decodable {
    var id: UUID?
    var stem: String = ""
    var explanation = ""
    var correctIndex = 1
    var answerAChoice = ""
    var answerAisCorrect = false
    var answerBChoice = ""
    var answerBisCorrect = false
    var answerCChoice = ""
    var answerCisCorrect = false
    var answerDChoice = ""
    var answerDisCorrect = false
    var answerEChoice = ""
    var answerEisCorrect = false
    
}

class AnswerAHold: Identifiable, Decodable {
    var answerChoice: String
    var isCorrect: Bool
}

class AnswerBHold: Identifiable, Decodable {
    var answerChoice: String
    var isCorrect: Bool
}

