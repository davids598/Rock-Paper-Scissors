//
//  SIgn.swift
//  RPS
//
//  Created by David Strathman on 6/12/19.
//  Copyright © 2019 David Strathman. All rights reserved.
//

import Foundation

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if (sign == 0)
    {
        print("Random sign returned rock")
        return .rock
    }
    else if (sign == 1)
    {
        print("Random sign returned paper")
        return .paper
    }
    else
    {
        print("Random Sign returned scissors")
        return .scissors
    }
}

enum Sign {
    case  rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .paper:
            return  "📄"
        case .rock:
            return "🗿"
        case .scissors:
            return "✂️"
        }
    }

    func compare(computerChoice: Sign) -> GameState
    {
        print("Compare function started")
        switch self {
        case .paper:
            switch computerChoice
            {
            case .paper: return GameState.Draw
            case .scissors: return GameState.Lose
            case .rock: return GameState.Win
            }
        case .rock:
            switch computerChoice {
            case .paper: return GameState.Lose
            case .rock: return GameState.Draw
            case .scissors: return GameState.Win
            }
        case .scissors:
            switch computerChoice {
            case .paper:  return GameState.Win
            case .rock:  return GameState.Lose
            case .scissors: return GameState.Draw
            }
        }
    }
}
