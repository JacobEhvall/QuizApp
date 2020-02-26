//
//  ViewController.swift
//  quizApp2
//
//  Created by Jacob  Ehnvall on 2020-01-07.
//  Copyright © 2020 Jacob  Ehnvall. All rights reserved.
//


import UIKit
import AVFoundation

// Declaration of each variabel.
class ViewController: UIViewController {
    var currentQuestion : Question?
    var currentQuestionPos: Int = 0
    var questionsAnswered: Int = 0
    var score: Int = 0
    var questions : [Question]!
    
    var audioPlayer : AVAudioPlayer?

    // make a connection for each thing
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
        
        // Check if there is any questions
        guard let _ = questions else { print("error no questions"); return}
        
        setQuestion()
        loadNextQuestion()
        updateUI()
        //restartGame()
}
    
    
    // submit/action button check which button user has pressed
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
    /* Submit/action button to choose if music should play or not(mute)
    then the image diplay if music is playing or not*/
    
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
    
    /* Function which check if the buttons index:Int are the correct answer
     and then display next question and score, if it's not correct it load next question */
    
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
        
        
        /* Checks if the QuestionPosition is´nt out of range and then add to next question.
         When all questions are showed it get to */
        
        if(currentQuestionPos < questions.count) {
            
            currentQuestion = questions[currentQuestionPos]
            setQuestion()
            currentQuestionPos += 1
           //If there are no more questions it will go to the segue with the identifier "ShowFinal"
        }   else {
            performSegue(withIdentifier: "ShowFinal", sender: nil)
            audioPlayer?.stop()
        }
        
        
    }
    
    /* Sets labels,image for question and buttons with alternative choices for current question,
     when button pressed scoreLabel and progress will be updated, we also check if there is an question*/
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
    
    // Update qustion, show how many questions and the collected score
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        lblProgress.text = "\(questionsAnswered + 1) /\(questions.count)"
    }
    
    
    /* When we move to the results screen/ShowFinal we pass how many
    correct answers we got, and the total number of questions */
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






