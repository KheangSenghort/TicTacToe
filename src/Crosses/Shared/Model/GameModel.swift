//
//  GameModel.swift
//  Crosses
//
//  Copyright (C) 2017  Sasmito Adibowo – http://cutecoder.org

//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.

//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.

//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

import GameplayKit

class GameModel : NSObject, NSCopying {

    let allPlayers = [
        Player(chip: .playerX),
        Player(chip: .playerO),
    ]
    
    var currentPlayer : Player?
    
    var state = GameBoardState()
    
    required override init() {
        super.init()
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let c = type(of: self).init()
        c.state = self.state
        c.activePlayer = activePlayer
        return c
    }
    
    func canMove(location: GameBoardState.Location) -> Bool {
        return state[location] == .empty
    }
    
    @discardableResult func move(location: GameBoardState.Location) -> Bool {
        guard canMove(location: location) else {
            return false
        }
        
        guard let player = currentPlayer else {
            return false
        }
        
        state[location] = player.chip
        return true
    }
}
