//
//  Question.swift
//  quizApp2
//
//  Created by Jacob  Ehnvall on 2020-01-22.
//  Copyright © 2020 Jacob  Ehnvall. All rights reserved.
//

import Foundation
// Decration of each variabel and of what type.  
class Question {
    let questionImage : String
    let question: String
    let answers: [String]
    let correctAnswer: Int
    var answered: Bool
  
    
   
    // Initialize each value before use.
    init(image: String, questionText: String, answers: [String], correct: Int){
        self.questionImage = image
        self.question = questionText
        self.answers = answers
        self.correctAnswer = correct
        self.answered = false
    }
  
}




    





