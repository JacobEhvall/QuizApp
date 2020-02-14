//
//  ResultsViewController.swift
//  
//
//  Created by Jacob  Ehnvall on 2020-01-13.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
   
    var questionsAnswered = 0
    var totalamountQuestion = 0
        
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblResults: UILabel!
    
    @IBOutlet var TotalScore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Counting the correct answers of the questions array and displays it to the user
        TotalScore.text = "\(questionsAnswered )"
        lblResults.text = "\(questionsAnswered ) out of \(totalamountQuestion) correct answers"
        
        
        let title = "Points"
    
     
        lblTitle.text = title

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
