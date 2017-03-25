//
//  GameBoard.swift
//  Crosses
//
//  Created by Sasmito Adibowo on 25/3/17.
//  Copyright © 2017 Basil Salad Software. All rights reserved.
//

import Foundation

struct GameBoardState {
    enum Cell {
        case empty
        case playerX
        case playerO
    }
    
    struct Location {
        var row = 0
        var column = 0
        
        init(column: Int, row: Int) {
            self.row = row
            self.column = column
        }
    }
    
    static let horizontalCount = 3
    static let verticalCount = 3
    
    /**
     Cells in (column,row) order (x.y)
     */
    private var cells = Array(repeating: Array(repeating: Cell.empty,count: horizontalCount), count: verticalCount)
    

    subscript(index: Location) -> Cell {
        get {
            return cells[index.column][index.row]
        }
        set {
            cells[index.column][index.row] = newValue
        }
    }
}
