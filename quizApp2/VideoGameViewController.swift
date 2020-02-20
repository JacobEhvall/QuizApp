//
//  VideoGameViewController.swift
//  quizApp2
//
//  Created by Jacob  Ehnvall on 2020-01-29.
//  Copyright © 2020 Jacob  Ehnvall. All rights reserved.
//

import UIKit
import AVFoundation

class VideoGameViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    
    var name : String?
    
    let segueToDisplayId = "segueToQuestions"
    
    var questions:[Question]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sound = Bundle.main.path(forResource: "New Tires", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch {
            print(error)
        }
    }
    
    @IBAction func NintendoPressed(_ sender: Any) {
        audioPlayer.play()
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
            destinationVC.audioPlayer = audioPlayer
           //destinationVC.music = music

        }

    }
   
}
