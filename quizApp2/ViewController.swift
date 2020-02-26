//
//  ViewController.swift
//  quizApp2
//
//  Created by Jacob  Ehnvall on 2020-01-07.
//  Copyright © 2020 Jacob  Ehnvall. All rights reserved.
//


import UIKit
import AVFoundation

class ViewController: UIViewController {
    var currentQuestion : Question?
    var currentQuestionPos: Int = 0
    var questionsAnswered: Int = 0
    var score: Int = 0
    var questions : [Question]!
    
    var audioPlayer : AVAudioPlayer?


    @IBOutlet var lblQuestion: UITextView!
    
    
    @IBOutlet var answer0: UIButton!
    @IBOutlet var answer1: UIButton!
    @IBOutlet var answer2: UIButton!
    @IBOutlet var answer3: UIButton!
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var lblProgress: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let _ = questions else { print("error no questions"); return}
        
        setQuestion()
        loadNextQuestion()
        updateUI()
        //restartGame()
}
    
    
    // Submit an answer
    @IBAction func submit0(_ sender: Any) {
        checkAnswer(index: 0)
        
    }
    
    @IBAction func submitAnser1(_ sender: Any) {
        checkAnswer(index: 1)
    }
    
    @IBAction func submitAnswer2(_ sender: Any) {
        checkAnswer(index: 2)
    }
    @IBAction func submitAnswer3(_ sender: Any) {
        checkAnswer(index: 3)
        
    }
    
    @IBAction func muteMusic(_ sender: UIButton) {
        if audioPlayer?.isPlaying == true {
            let image = UIImage(named:"mute")
            sender.setImage(UIImage(named:"mute"), for: .normal)
            audioPlayer?.stop()
        }
        else{
            audioPlayer?.play()
            let image = UIImage(named:"Sound")
            sender.setImage(UIImage(named:"Sound"), for: .normal)
        }
    }
    
    func checkAnswer(index: Int) {
        if(index == currentQuestion?.correctAnswer) {
            currentQuestion?.answered = true
            questionsAnswered += 1
            score += 1
        } else {
            questionsAnswered += 1
            
        }
        
        
        loadNextQuestion()
    }
    
    
    func loadNextQuestion() {
        
        
        // Show next question
        if(currentQuestionPos < questions.count) {
            
            currentQuestion = questions[currentQuestionPos]
            setQuestion()
            currentQuestionPos += 1
            //If there are no more questions show the results
        }   else {
            performSegue(withIdentifier: "ShowFinal", sender: nil)
            audioPlayer?.stop()
        }
        
        
    }
    
    // Set labels and buttions for the current question
    func setQuestion() {
        
        guard  let question = currentQuestion else {return}
        
        imageView.image = UIImage(named:(question.questionImage))
        lblQuestion.text = question.question
        answer0.setTitle(question.answers[0], for: .normal)
        answer1.setTitle(question.answers[1], for: .normal)
        answer2.setTitle(question.answers[2], for: .normal)
        answer3.setTitle(question.answers[3], for: .normal)
        lblProgress.text = "\(currentQuestionPos + 1) / \(questions.count)"
        updateUI()
    
    }
    
    // Update qustions and the collected points 
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        lblProgress.text = "\(questionsAnswered + 1) /\(questions.count)"
    }
    
    
    // Before we move to the results screen pass the how many we got correct, and the total number of questions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowFinal") {
            let vc = segue.destination as! TestResultViewController
            
            vc.questions = questions
            vc.audioPlayer = audioPlayer

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
}






