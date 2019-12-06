//
//  ViewController.swift
//  RPS
//
//  Created by David Strathman on 6/12/19.
//  Copyright © 2019 David Strathman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var robotSign: UILabel!
    @IBOutlet weak var outcome: UILabel!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var playAgain: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateScreen(gamestate: .Start)
    }
    
    @IBAction func playRock(_ sender: Any) {
        play(sign: .rock)
    }
    
    @IBAction func playPaper(_ sender: Any) {
        play(sign: .paper)
    }
    
    @IBAction func playScissors(_ sender: Any) {
        play(sign: .scissors)
    }
    
    @IBAction func gameOver(_ sender: Any) {
        updateScreen(gamestate: .Start)
    }
    
    func updateScreen(gamestate: GameState) {
        switch gamestate {
        case .Start:
            outcome.text = "Rock, Paper, Scissors?"
            view.backgroundColor = .white
            robotSign.text = "🤖"
            playAgain.isHidden  =  true; playAgain.isEnabled = false
            rock.isEnabled = true; rock.isHidden = false
            paper.isEnabled = true; paper.isHidden = false
            scissors.isEnabled = true; scissors.isHidden = false
        case .Win:
            outcome.text = "CONGRATS, U WIN"
            view.backgroundColor = .green
        case .Lose:
            outcome.text = "GET REKT NERD"
            view.backgroundColor = .red
        case .Draw:
            outcome.text = "WELL, THIS IS LAME"
            view.backgroundColor = .yellow
        }
    }
    
    
    func play(sign: Sign) {
        print("Play function started")
        let compChoice: Sign = randomSign()
        let result = sign.compare(computerChoice: compChoice)
        print("Compared successfully")
        updateScreen(gamestate: result)
        robotSign.text = compChoice.emoji
        rock.isEnabled = false
        scissors.isEnabled = false
        paper.isEnabled = false
        switch sign {
        case .paper: rock.isHidden = true; scissors.isHidden = true
        case .rock: paper.isHidden = true; scissors.isHidden = true
        case .scissors: paper.isHidden = true; rock.isHidden = true
        }
        playAgain.isHidden = false; playAgain.isEnabled = true
        print("Play ran successfully")
    }
}
