//
//  GameSession.swift
//  Crosses
//
//  Created by Sasmito Adibowo on 25/3/17.
//  Copyright © 2017 Basil Salad Software. All rights reserved.
//

import GameplayKit

class GameSession {
    lazy var strategist : GKMinmaxStrategist = {
        let s = GKMinmaxStrategist()
        s.maxLookAheadDepth = 14;
        s.randomSource = GKARC4RandomSource()
        return s
    }()
}

