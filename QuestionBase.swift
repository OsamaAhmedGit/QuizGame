//
//  QuestionBase.swift
//  Quiz
//
//  Created by Osama Ahmed on 18/01/2018.
//  Copyright © 2018 Osama Ahmed. All rights reserved.
//

import Foundation

/* QUESTION CLASS WHICH I USE IN A WAY SIMILAR TO A STRUCT, QUESTION OBJECTS ARE CREATED FROM THIS BLUEPRINT */
class QuestionBase {
    
    var question: String /* QUESTION VARIABLE */
    var answer: Bool /* ANSWER VARIABLE */
    
    
    /* INITIALIZE FUNCTION WHICH SETS THE QUESTION AND ANSWER PASSED INTO IT WHEN A NEW INSTANCE IS CREATED */
    init(Question: String, Answer: Bool) {
        question = Question
        answer = Answer
    }
}
