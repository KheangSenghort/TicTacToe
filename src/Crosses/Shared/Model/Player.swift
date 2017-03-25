//
//  Player.swift
//  Crosses
//
//  Created by Sasmito Adibowo on 25/3/17.
//  Copyright © 2017 Basil Salad Software. All rights reserved.
//

import Foundation
import GameplayKit

class Player : NSObject  {
    let chip : GameBoardState.Cell
    
    init(chip : GameBoardState.Cell) {
        self.chip = chip
    }

}
