//
//  QuestionArray.swift
//  quizApp2
//
//  Created by Jacob  Ehnvall on 2020-01-22.
//  Copyright © 2020 Jacob  Ehnvall. All rights reserved.
//

import Foundation

class QuestionArray {
    
    // Declared variabel that holds questions in an Questionarray on for NES and one for SEGA.
    var questionsNES = [Question]()
    var questionsSEGA = [Question]()
    
    // The index in Answers in QuestionArray start count from 0.
    private var currentIndex = 0
    
    /* Every question in NES or SEGA
    counts and is a type of Int. */
    
    var countNES : Int {
        return questionsNES.count
    }
    var countSEGA : Int {
        return questionsSEGA.count
    }
    
    
    // An init() function which hold a Question in questions for NES and SEGA.
    init() {
        let q1 = Question(image: "Picture0",questionText: "In the Super Mario games what can you not get?", answers: ["Stones", "Golden coins", "Mushrooms", "Stars"], correct: 0)
        questionsNES.append(q1)
        let q2 = Question(image: "Picture1",questionText: "In one of the game series there is one italian plumber who likes pasta, what is his name?", answers:["Wario","Mario","Peach","Toad"], correct: 1)
        questionsNES.append(q2)
        let q3 = Question(image: "Picture2",questionText: "Whats the name of the ghosts in Pacman?", answers:["Gere,Terra,Core,Tink","Tech,Egoq,Cyb,Devi","Pinky,Inky,Clyde,Blinky","Mickro,Tin,Sparkle,Owy"], correct: 2)
        questionsNES.append(q3)
        let q4 = Question(image: "Picture3", questionText: "In what year did the Nintendo 8 bit get to Sweden?", answers:["1989", "1994", "1986", "1991"], correct: 2)
        questionsNES.append(q4)
        let q5 = Question(image: "Picture4", questionText: "Whats the name of the first Zelda game?", answers: ["A Link to Past", "Majoras Mask", "The Legend of Zelda", "Zelda Links Awakening DX"], correct: 2)
        questionsNES.append(q5)
        let q6 = Question(image: "Picture5",questionText: "Abiibos are small figures for the 3ds consoles and one more?", answers: ["WII U", "DS Lite", "Nintendo DS", "Game Gear"], correct: 0)
        questionsNES.append(q6)
        let q7 = Question(image: "Picture6",questionText: "Which of the following consoles was first realsed?", answers: ["WII U", "DS Lite", "Nintendo DS", "Game Gear"], correct: 0)
        questionsNES.append(q7)
        let q8 = Question(image: "Picture7",questionText: "Who is the creator of Mario, Zelda etc.. ", answers: ["Kenshi Miyamoto", "Yasuko Miyamoto", "Shigeru Miyamoto", "Fusajiro Yamauchi"], correct: 2)
        questionsNES.append(q8)
        let q9 = Question(image: "Picture8",questionText: "Who is the main charcter in the Zelda games", answers: ["Zelda", "Link", "Gandondorf", "Mario"], correct: 1)
        questionsNES.append(q9)
        let q10 = Question(image: "Picture9",questionText: "What’s the color of the first Gameboy?", answers: ["Blue", "Gray", "Green", "Yellow"], correct: 1)
        questionsNES.append(q10)
        let q11 = Question(image: "CIB means",questionText: "Which of these are the most expensive NES cartridge?", answers: ["Snake N Roll","Duck Hunt","Mr Gimmick","Mario bros 3"], correct: 2)
        questionsNES.append(q11)
        let q12 = Question(image: "CIB means", questionText: "What does CIB mean", answers:["Complete inside box","Compare inside box", "Complete in box","Compare in book"], correct: 2)
        questionsNES.append(q12)
        let q13 = Question(image: "NES games",questionText: "Which NES Box has´nt yellow box", answers: ["Ware Wolf", "Mario Bros 3", "Mario and Yoshi", "Super Mario bros 2"], correct: 3)
        questionsNES.append(q13)
        let q14 = Question(image: "DuckHunt",questionText: "What are the name of this NES serie", answers: ["The NES collectible serie", "The black box serie", "The small boxes serie","The Nintendo Collectible"], correct: 1)
        questionsNES.append(q14)
        
        
        let q15 = Question(image: "RistarPicture",questionText:"Ristar inspiered to the creation of the game character Sonic. What kind of figure is Ristar", answers: ["Cub", "Star", "spherical shape","triangle"], correct: 1)
        questionsSEGA.append(q15)
        let q16 = Question(image: "sega-genesis",questionText: "One of the worst game ever made for Sega MegaDrive is?", answers: ["Dynamite Harry", "Shaq Fuu", "Comiz Zone","Sunset Riders"], correct: 1)
        questionsSEGA.append(q16)
        let q17 = Question(image: "Sega spel q17", questionText: "How much does Tetris for SEGA Mega Drive cost,in SEK?", answers: ["1000-1200","2000 - 2500", "3400 - 4000", "25000 - 140 000"], correct: 3)
        questionsSEGA.append(q17)
        let q18 = Question(image: "MegaDrive", questionText: "What´s the inhouse-name for Mega Drive?", answers:[ "M8-1541","M7-1833","MK-1601","MK-1221"], correct: 2)
        questionsSEGA.append(q18)
        let q19 = Question(image: "SEGA bild", questionText: "What´s the abbrevation for the SEGA name?", answers:[ "SErive GAmes","SElectic GAmes","SElected GAmes","SEgue GAmes"], correct: 0)
        questionsSEGA.append(q19)
       let q20 = Question(image: "q20", questionText: "What´s the SEGA boxes made of?", answers:[ "Paper","plastic","Cardboard","styrofoam"], correct: 0)
        questionsSEGA.append(q20)
       let q21 = Question(image: "q21", questionText: "SEGA has realsed a mini console of which of their consoles?", answers:[ "SEGA Saturn","SEGA Dreamcast","SEGA SG-1000","SEGA Megadrive"], correct: 3)
        questionsSEGA.append(q21)
        let q22 = Question(image: "DuckHunt", questionText: "To play SEGA games on japan consoles,Genesis, You can play with?", answers: ["Power conveter", "Power Base Conveter","Power Backable","Backaable Play" ], correct: 1)
        questionsSEGA.append(q22)
        let q23 = Question(image: "SEGA1", questionText: "What color is the SEGA logo?", answers: ["Yellow", "Green", "Pink", "Blue"], correct: 3)
        questionsSEGA.append(q23)
        let q24 = Question(image: "SEGA macot", questionText: "What mascot is the SEGA company known for?", answers: ["Sonic", "Ristar", "Tails", "Alex the Kid"], correct: 0)
        questionsSEGA.append(q24)
        let q25 = Question(image: "q25", questionText: "What´s the name of Gamegear in USA?", answers: ["DreamCast", "Genesis", "SEGA Mastersystem", "SEGA game gear"], correct: 0)
        questionsSEGA.append(q25)
        let q26 = Question(image:"SEGA Company", questionText: "When was SEGA founded?", answers: ["1945", "1940", "1939", "1938"], correct: 1)
         questionsSEGA.append(q26)

        

        
        
        // Shuffle the questions for NES and SEGA
        questionsNES.shuffle()
        questionsSEGA.shuffle()
        
    /* Return questionsNES or questionSEGA.*/
    }
    func getNES() -> [Question] {
        return questionsNES
    }
    func getSEGA() -> [Question] {
        return questionsSEGA
    }
     /* Get a random Question optional from NES or SEGA,
     optional = there cound be a question or no question.
     For every question the index will increase by 1. */
    
    func getRandomQuestionNES() -> Question? {
        if currentIndex < questionsNES.count {
            let q = questionsNES[currentIndex]
            currentIndex += 1
            return q
        }
        return nil
    }
    func getRandomQuestionSEGA() -> Question? {
           if currentIndex < questionsSEGA.count {
               let qu = questionsSEGA[currentIndex]
               currentIndex += 1
               return qu
           }
           return nil
   }

}






