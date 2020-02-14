//
//  VideoGameViewController.swift
//  quizApp2
//
//  Created by Jacob  Ehnvall on 2020-01-29.
//  Copyright © 2020 Jacob  Ehnvall. All rights reserved.
//

import UIKit

class VideoGameViewController: UIViewController {
    
    var name : String?
    
    let segueToDisplayId = "segueToQuestions"
    
    var questions:[Question]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func NintendoPressed(_ sender: Any) {
        questions = QuestionArray().getNES()
        
        performSegue(withIdentifier: segueToDisplayId, sender: self)
    }
    
    
    @IBAction func segaPressed(_ sender: UIButton) {
        questions = QuestionArray().getSEGA()
        performSegue(withIdentifier: segueToDisplayId, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToDisplayId {
            let destinationVC = segue.destination as! ViewController
            
            destinationVC.questions = questions
        }
        
    }
    
    
    
}       

