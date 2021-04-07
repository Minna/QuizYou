//
//  ViewController.swift
//  QuizYou
//
//  Created by Minna on 07/04/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if(userGotItRight){
            sender.backgroundColor = UIColor.green
            
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc  func updateUI()
     {
        questionLabel.text = quizBrain.getNextQuestionText()
        let answers = quizBrain.getChoices()
        choiceOne.setTitle(answers[0], for: .normal)
        choiceTwo.setTitle(answers[1], for: .normal)
        choiceThree.setTitle(answers[2], for: .normal)

        choiceOne.backgroundColor = UIColor.clear
        choiceTwo.backgroundColor = UIColor.clear
        choiceThree.backgroundColor = UIColor.clear
        
        progressView.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
    
}

