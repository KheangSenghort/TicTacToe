//
//  GameModel.swift
//  Crosses
//
//  Created by Sasmito Adibowo on 25/3/17.
//  Copyright © 2017 Basil Salad Software. All rights reserved.
//

import GameplayKit

class GameModel : NSObject, NSCopying {

    let allPlayers = [
        Player(chip: .playerX),
        Player(chip: .playerO),
    ]
    
    var currentPlayer : Player?
    
    var state = GameBoardState()
    
    override init() {
        
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let c = super.copy() as! GameModel
        c.state = self.state
        c.activePlayer = activePlayer
        return c
    }
}
