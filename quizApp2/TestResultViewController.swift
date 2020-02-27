//
//  TestResultViewController.swift
//  quizApp2
//
//  Created by Jacob  Ehnvall on 2020-02-05.
//  Copyright © 2020 Jacob  Ehnvall. All rights reserved.
//

import UIKit
import AVFoundation

class TestResultViewController: UIViewController , UITableViewDataSource {
    
    var score = 0 // Declaration of variabel, score start count from 0  (score = 0)
    
    var audioPlayer : AVAudioPlayer? // Declaration of the audioplayer. It´s an optional cause there could be value or not.
    
    // Connection/ Outlets for tableView,ScoreTotal, and lblProgress which show your results.
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var ScoreTotal: UILabel!
    
    @IBOutlet weak var lblProgress: UILabel!
    
   // ActionButton when user click restart the Quizgame the score will be set to 0.
    @IBAction func restartGame(_ sender: Any) {
       score = 0
    }
    
   
    // we take the questions and force to get a question out of the array.
    var questions : [Question]!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Checks correct answered questions from questionarray
        for question in questions {
            if question.answered {
                score += 1
            }
        }
        //Show your total score and the total correct of answered questions in the and og the quizgame.
        ScoreTotal.text = "\(score)"
        lblProgress.text = "You got \(score) correct, out of \(questions.count) questions"
        
        
        
        //Says that we are the datasSource to the tableView
        tableView.dataSource = self
        
    }
    // Counts and displays the cells in the tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! PictureCell

        /* Checks if the answered cell is right or wrong
         if it´s correct it will be green and say "Correct", wrong it will be red and say "Wrong"*/
        if questions[indexPath.row].answered {
            cell.backgroundColor = UIColor.green
            cell.textLabel?.text = "Correct"
        } else {
            cell.backgroundColor = UIColor.red
            cell.textLabel?.text = "Wrong"
        }
        
        // Display the image for each tableview cell from QuestionArray and return a cell.
        cell.picture.image =  UIImage(named: questions[indexPath.row].questionImage)
        
        return cell
    }
       
}
