//
//  QuestionManager.swift
//  Quiz
//
//  Created by Osama Ahmed on 18/01/2018.
//  Copyright © 2018 Osama Ahmed. All rights reserved.
//

import Foundation


/* CLASS WHICH STORES ALL THE QUESTIONS IN IT */
class QuestionManager {
    
    var questionArray = [QuestionBase]() /* ARRAY WHICH HOLDS ALL THE QUESTION OBJECTS */
    
    /* FUNCTION WHICH AUTOMATICALLY RUNS WHEN THE PROGRAM STARTS AND STORES ALL THE QUESTIONS AND ANSWERS IN THE ARRAY */
    init() {
        questionArray.append(QuestionBase(Question: "Maradonas' Hand Of God goal was scored in 1986", Answer: true))
        questionArray.append(QuestionBase(Question: "The national sport in Japan is table tennis", Answer: false))
        questionArray.append(QuestionBase(Question: "The move Titanic got 11 Oscars", Answer: true))
        questionArray.append(QuestionBase(Question: "The house number for the Simpsons is 742", Answer: true))
        questionArray.append(QuestionBase(Question: "Pitta bread is originally from Greece", Answer: true))
        questionArray.append(QuestionBase(Question: "Earth is the closest planet to the Sun", Answer: false))
        questionArray.append(QuestionBase(Question: "A Telescope is the apparatus used to look at the stars", Answer: true))
        questionArray.append(QuestionBase(Question: "The Great Wall of China is 10000m long", Answer: false))
        questionArray.append(QuestionBase(Question: "Enzo Ferrari is the inventor of Ferrari", Answer: true))
        questionArray.append(QuestionBase(Question: "The biggest creature on Earth is the Great White Shark", Answer: false))
    }
}
