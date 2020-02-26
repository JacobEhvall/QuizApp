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
    
    var score = 0 // Declaration of start count score = 0
    
    var audioPlayer : AVAudioPlayer? // Declaration of the audioplayer and of type which could be nil or have a sound.
    
    // Connection/ Outlets for tableView,ScoreTotal, and lblProgress showing your results.
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var ScoreTotal: UILabel!
    
    @IBOutlet weak var lblProgress: UILabel!
    
   // ActionButton to restart the Quiz the score will be restored to 0.
    @IBAction func restartGame(_ sender: Any) {
       score = 0
    }
    
   
    
    var questions : [Question]!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Checks correct answered questions
        for question in questions {
            if question.answered {
                score += 1
            }
        }
        //Show Your total score and the total correct of answered questions.
        ScoreTotal.text = "\(score)"
        lblProgress.text = "You got \(score) correct, out of \(questions.count) questions"
        
        
        
        //Says that we are the datasSourse to the tableView
        tableView.dataSource = self
        
    // Counts and displays the cells in the tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! PictureCell

        /* Checks if the answered cell is right or wrong
         if it´s correct it will be green, wrong it will be red */
        if questions[indexPath.row].answered {
            cell.backgroundColor = UIColor.green
            cell.textLabel?.text = "Correct"
        } else {
            cell.backgroundColor = UIColor.red
            cell.textLabel?.text = "Wrong"
        }
        
        // Display the image for each tableview cell.
        cell.picture.image =  UIImage(named: questions[indexPath.row].questionImage)
        
        return cell
    }
       
}
