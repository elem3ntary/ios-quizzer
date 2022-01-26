//
//  Question.swift
//  Quizzer
//
//  Created by elem on 23.01.2022.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a:String) {
        text = q
        answer = a
    }
}
