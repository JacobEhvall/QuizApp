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
 //   var audioPlayer2 = AVAudioPlayer()
    
    
    var name : String?
    
    var soundNintendo :String!
    var soundSega :String!
    
    let segueToDisplayId = "segueToQuestions"
    
    var questions:[Question]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        soundNintendo = Bundle.main.path(forResource: "New Tires", ofType: "mp3")
        soundSega = Bundle.main.path(forResource: "Adventures", ofType: "mp3")
}
    
    @IBAction func NintendoPressed(_ sender: Any) {
        
        questions = QuestionArray().getNES()
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundNintendo))
        }
        catch {
            print(error)
        }
        
        
        audioPlayer.play()
        performSegue(withIdentifier: segueToDisplayId, sender: self)
    }
    
    
    @IBAction func segaPressed(_ sender: UIButton) {
     
        questions = QuestionArray().getSEGA()
        
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundSega))
        }
        catch {
            print(error)
        }
        
        audioPlayer.play()
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
