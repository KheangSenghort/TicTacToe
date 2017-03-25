//
//  GameBoard.swift
//  Crosses
//
//  Created by Sasmito Adibowo on 25/3/17.
//  Copyright © 2017 Basil Salad Software. All rights reserved.
//

import SpriteKit

class GameBoard : SKSpriteNode {
    var currentBoardState = GameBoardState()
    
    func toggleState(at: CGPoint) {
        let boardPos = cellLocationFrom(nodePoint: at)
        print("toggleState: \(boardPos)")
        let cellValue = currentBoardState[boardPos]
        if cellValue == .empty {
            // toggle state

            let node = SKSpriteNode(imageNamed: "Player_X")
            node.position = nodePointFrom(cellLocation: boardPos)
            self.addChild(node)
            currentBoardState[boardPos] = .playerX
        }
    }
    
    
    func cellLocationFrom(nodePoint: CGPoint) -> GameBoardState.Location {
        let size = self.size
        let anchorPoint = self.anchorPoint
        let cellSize = CGSize(width: size.width / CGFloat(GameBoardState.horizontalCount), height: size.height / CGFloat(GameBoardState.verticalCount))
        let column = Int(floor((nodePoint.x + size.width * anchorPoint.x) / cellSize.width))
        let row = Int(floor((nodePoint.y + size.height * anchorPoint.y) / cellSize.height))
        return GameBoardState.Location(column: column, row: row)
    }
    
    func nodePointFrom(cellLocation: GameBoardState.Location) -> CGPoint {
        let size = self.size
        let anchorPoint = self.anchorPoint
        let cellSize = CGSize(width: size.width / CGFloat(GameBoardState.horizontalCount), height: size.height / CGFloat(GameBoardState.verticalCount))
        let x = round(CGFloat(cellLocation.column) * cellSize.width - size.width * anchorPoint.x + cellSize.width / 2)
        let y = round(CGFloat(cellLocation.row) * cellSize.height - size.height * anchorPoint.y + cellSize.height / 2)
        return CGPoint(x: x, y: y)
    }
}


#if os(iOS) || os(tvOS)
    // Touch-based event handling
    extension GameBoard {
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            let touch = touches.first!
            toggleState(at: touch.location(in: self))
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            //print("touchesMoved: \(touches)")
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            //print("touchesEnded: \(touches)")
        }
        
        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            //print("touchesCancelled: \(touches)")
        }
    }
#endif
