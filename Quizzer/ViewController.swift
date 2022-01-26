//
//  ViewController.swift
//  Quizzer
//
//  Created by elem on 21.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
    var quizBrain  = QuizBrain()
    let darkGreenColor = UIColor(red: 38.0/255, green: 166.00/255, blue: 91.00/255, alpha: 1.00)
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    


    func resetBorders(){
        trueButton.layer.borderColor = UIColor.clear.cgColor
        falseButton.layer.borderColor = UIColor.clear.cgColor
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text


        if quizBrain.checkAnswet(userAnswer!){
            sender
                .layer.borderColor = darkGreenColor.cgColor
        } else {
            sender.layer.borderColor = UIColor.red.cgColor
        }

        quizBrain.goToNextQuestion()
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false){_ in
            self.updateUI()
        }
        
    }
    
    func updateUI(){
        questionNumberLabel.text = quizBrain.getQuestionNumberText()
        progressBar.progress = quizBrain.getQuestionProgress()
        questionLabel.text = quizBrain.getQuestionText()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        resetBorders()
    }
}

