//
//  VideoGameViewController.swift
//  quizApp2
//
//  Created by Jacob  Ehnvall on 2020-01-29.
//  Copyright © 2020 Jacob  Ehnvall. All rights reserved.
//

/* import diffrent packages,
declare a strings for music, and get the player to play music (NES and SEGA)*/
import UIKit
import AVFoundation

class VideoGameViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    
    var name : String?
    
    var soundNintendo :String!
    var soundSega :String!
  
    
    let segueToDisplayId = "segueToQuestions"
    
    var questions:[Question]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

      /* Take in music to each button, a music and of which filetype.
      It will then play the music from either NES or SEGA. */
        
        soundNintendo = Bundle.main.path(forResource: "New Tires", ofType: "mp3")
        soundSega = Bundle.main.path(forResource: "Adventures", ofType: "mp3")
}
    // When button Nintendo is pressed it gets the questions from NES array and play the Nintendo music.
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
    
    // When button SEGA is pressed it gets the questions from SEGA array and play the SEGA music.
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

        }

    }
   
}
