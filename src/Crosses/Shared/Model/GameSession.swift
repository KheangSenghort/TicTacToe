//
//  GameSession.swift
//  Crosses
//
//  Created by Sasmito Adibowo on 25/3/17.
//  Copyright © 2017 Basil Salad Software. All rights reserved.
//

import GameplayKit

class GameSession {
    
    weak var delegate : GameSessionDelegate?
    
    lazy var strategist : GKMinmaxStrategist = {
        let s = GKMinmaxStrategist()
        s.maxLookAheadDepth = 42;
        s.randomSource = GKARC4RandomSource()
        s.gameModel = self.model
        return s
    }()
    
    let model = GameModel()
    
    let userPlayer: Player
    
    let computerPlayer: Player
    
    let computerPlayerQueue = DispatchQueue(label: "computer AI",qos: .userInteractive)
 
    init() {
        userPlayer = model.allPlayers[0]
        computerPlayer  = model.allPlayers[1]
        model.currentPlayer = userPlayer
    }
    
    func makeUserPlayerMove(location : GameBoardState.Location) -> Bool {
        guard model.currentPlayer == userPlayer else {
            return false
        }
        guard model.canMove(location: location) else {
            return false
        }
        model.move(location: location)
        delegate?.gameSession(self, player: userPlayer, didMoveTo: location)
        
        if model.isWin(for: userPlayer) {
            delegate?.gameSession(self, didWinForPlayer: userPlayer)
        } else if model.state.isTie() {
            delegate?.gameSessionDidTie(self)
        } else {
            model.currentPlayer = computerPlayer
            DispatchQueue.main.async {
                self.calculateComputerMove()
            }
        }
        return true
    }
    
    func calculateComputerMove() {
        guard model.currentPlayer == computerPlayer else {
            return
        }
        
        let strategist = self.strategist
        let player = computerPlayer
        computerPlayerQueue.async {
            let move = strategist.bestMove(for: player) as! GameMove
            DispatchQueue.main.async {
                guard self.model.move(location: move.moveTo) else {
                    return
                }
                self.delegate?.gameSession(self, player: player, didMoveTo: move.moveTo)
                if self.model.isWin(for: player) {
                    // computer won
                    self.delegate?.gameSession(self, didWinForPlayer: player)
                } else if self.model.state.isTie() {
                    self.delegate?.gameSessionDidTie(self)
                } else {
                    self.model.currentPlayer = self.userPlayer
                }
            }
        }
    }
}

protocol GameSessionDelegate: class {
    
    func gameSession(_ session: GameSession, player: Player, didMoveTo location: GameBoardState.Location)
    
    func gameSession(_ session: GameSession, didWinForPlayer wonPlayer: Player)

    func gameSessionDidTie(_ session: GameSession)

}

