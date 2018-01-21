//
//  ViewController.swift
//  Quiz
//
//  Created by Osama Ahmed on 18/01/2018.
//  Copyright © 2018 Osama Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel! /* LABEL DISPLAYING THE QUESTION */
    @IBOutlet weak var pointsLabel: UILabel! /* LABEL DISPLAYING THE POINTS */
    
    var questionNumber : Int = 0 /* VARIABLE TO KEEP RECORD OF WHICH QUESTION TO DISPLAY */
    var correctAnswer : Bool? /* VARIABLE WHICH STORES THE CORRECT ANSWER OF THE CURRENT QUESTION */
    var pickedAnswer : Bool? /* VARIABLE TO STORE THE ANSWER WHICH THE USER PICKS */
    var points = 0 /* VARIABLE TO KEEP RECORD OF THE POINTS */
    
    var correctSound: SoundManager?
    var incorrectSound: SoundManager?
    
    let questionManager = QuestionManager() /* CREATING INSTANCE OF THE QUESTION MANAGER CLASS, THIS WILL AUTOMATICALLY TRIGGER THE INIT FUNCTION */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateUI() /* INITIALIZE THE QUESTION, ANSWER AND POINTS TO BE DISPLAYED */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* FUNCTION WHEN THE TRUE OR FALSE BUTTONS ARE PRESSED, USING BUTTON TAGS SET IN THE STORYBOARD */
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.tag == 1{
            pickedAnswer = true /* IF TRUE IS PRESSED, SET PICKEDANSWER VARIABLE TO TRUE */
            
        } else if sender.tag == 2{
            pickedAnswer = false /* IF FALSE IS PRESSED, SET PICKEDANSWER VARIABLE TO FALSE */
        }
        
        playSound() /* CALL PLAYSOUND FUNCTION */
        checkAnswer() /* CALL CHECKANSWER FUNCTION */
        nextQuestion() /* CALL NEXTQUESTION FUNCTION */
        updateUI() /* CALL UPDATEUI FUNCTION */
    }
    
    /* FUNCTION WHICH CHECKS THE USERS ANSWER TO THE CORRECT ANSWER OF THE QUESTION */
    func checkAnswer(){
        if pickedAnswer == correctAnswer{ /* IF ANSWER MATCHES THE CORRECT ANSWER +1 TO POINTS AND SHOW SUCCESS HUD */
            points += 1
            ProgressHUD.showSuccess("Correct!") /* 3RD PARTY HUD */
            correctSound?.playSound() /* CALL THE PLAYSOUND FUNCTION IN THE SOUNDMANAGER CLASS */
        } else{
            ProgressHUD.showError("Wrong!")
            incorrectSound?.playSound()
        }
    }
    
    /* FUNCTION TO SET THE CORRECT SOUNDS DEPENDING ON THE CORRECTANSWER OF THE QUESTION */
    func playSound(){
        if correctAnswer == true{
            correctSound = SoundManager(FileName: "correct")
        } else if correctAnswer == false{
            incorrectSound = SoundManager(FileName: "incorrect")
        }
    }
    
    /* FUNCTION WHICH PROGRESSES THROUGH THE QUESTION BY ADDING 1 TO THE QUESTION NUMBER INDEX */
    func nextQuestion() {
        if questionNumber < questionManager.questionArray.count - 1{ /* IF QUESTION NUMBER INDEX IS IN RANGE OF THE QUESTION ARRAY SIZE */
            questionNumber += 1
        } else {
            showCompleted() /* CALL SHOWCOMPLETED FUNCTION */
        }
    }
    
    /* FUNCTION TO UPDATE WHAT IS DISPLAYED ON SCREEN */
    func updateUI(){
        pointsLabel.text = "\(points)"
        questionLabel.text = questionManager.questionArray[questionNumber].question
        correctAnswer = questionManager.questionArray[questionNumber].answer
    }
    
    /* FUNCTION TO RESET THE QUIZ WHEN ALL QUESTIONS ARE ANSWERED */
    func restartQuiz(){
        points = 0
        questionNumber = 0
        updateUI()
    }
    
    /* FUNCTION WHICH SHOWS AN ALERT ON SCREEN AND ALLOWS THE USER TO RESET THE QUIZ AND PLAY AGAIN */
    func showCompleted(){
        let alertController = UIAlertController(title: "Quiz Complete", message:
            "You Scored " + "\(points)" + "/" + "\(questionManager.questionArray.count)", preferredStyle: UIAlertControllerStyle.alert) /* CREATION OF ALERT CONTROLLER TO DISPLAY USERS SCORE */
        
        let restartAction = UIAlertAction(title: "Restart Quiz", style: .default, handler: {(UIAlertAction) in self.restartQuiz()}) /* ALERT ACTION FOR WHEN USER PRESSES THE RESTART QUIZ BUTTON */
        
        alertController.addAction(restartAction) /* ADD RESTART ACTION TO THE ALERT CONTROLLER */
        
        self.present(alertController, animated: true, completion: nil) /* SHOW THE ALERT WINDOW ON THE SCREEN */
    }
    
}

