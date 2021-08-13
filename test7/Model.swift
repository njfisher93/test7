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
    var answers = [""]
}
