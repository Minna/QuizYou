//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Minna on 07/04/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
            text = q
            answers = a
            rightAnswer = correctAnswer
        }
}
