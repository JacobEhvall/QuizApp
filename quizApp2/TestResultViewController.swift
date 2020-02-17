//
//  TestResultViewController.swift
//  quizApp2
//
//  Created by Jacob  Ehnvall on 2020-02-05.
//  Copyright © 2020 Jacob  Ehnvall. All rights reserved.
//

import UIKit

class TestResultViewController: UIViewController , UITableViewDataSource {
    
    var score = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var ScoreTotal: UILabel!
    
    @IBOutlet weak var lblProgress: UILabel!
    
   
    @IBAction func restartGame(_ sender: Any) {
       score = 0
    }
    
   
    
    var questions : [Question]!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        for question in questions {
            if question.answered {
                score += 1
            }
        }
        ScoreTotal.text = "\(score)"
        lblProgress.text = "You got \(score) correct, out of \(questions.count) questions"
        
        
       //print("score: \(score) antal: \(questions.count)")
        
        
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! PictureCell

        
        if questions[indexPath.row].answered {
            cell.backgroundColor = UIColor.green
            cell.textLabel?.text = "Correct"
        } else {
            cell.backgroundColor = UIColor.red
            cell.textLabel?.text = "Wrong"
        }
        
        
        //cell.textLabel?.text = String(questions[indexPath.row].answered)  Skriver ut true eller false i tableviewn
        cell.picture.image =  UIImage(named: questions[indexPath.row].questionImage)
        
        return cell
    }
    
        
       
       
}
