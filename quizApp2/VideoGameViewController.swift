//
//  VideoGameViewController.swift
//  quizApp2
//
//  Created by Jacob  Ehnvall on 2020-01-29.
//  Copyright © 2020 Jacob  Ehnvall. All rights reserved.
//

// import diffrent packages, declare a strings for music, and get the player to play music (NES and SEGA)
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
        

//       Get the music from the catecorie choose, takes the music name and of which filetype.
//       When button pressed it playes the music and get the questions from array NES/SEGA.
        
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

        }

    }
   
}
