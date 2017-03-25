//
//  GameScene.swift
//  Crosses
//
//  Created by Sasmito Adibowo on 25/3/17.
//  Copyright © 2017 Basil Salad Software. All rights reserved.
//

import SpriteKit
#if os(watchOS)
    import WatchKit
    // <rdar://problem/26756207> SKColor typealias does not seem to be exposed on watchOS SpriteKit
    typealias SKColor = UIColor
#endif

class GameScene: SKScene,GameBoardSpriteDelegate,GameSessionDelegate {
    
    class func newGameScene() -> GameScene {
        // Load 'GameScene.sks' as an SKScene.
        guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else {
            print("Failed to load GameScene.sks")
            abort()
        }
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFit
        
        return scene
    }
    
    var session : GameSession? {
        didSet {
            if let s = session {
                s.delegate = self
            }
        }
    }

    weak var gameBoard : GameBoardSprite? {
        didSet {
            if let v = gameBoard {
                v.delegate = self
            }
        }
    }
    
    func setUpScene() {
        let gameBoard = self.childNode(withName: "//board") as! GameBoardSprite
        gameBoard.isUserInteractionEnabled = true
        self.gameBoard = gameBoard
        self.session = GameSession()
    }
    
    #if os(watchOS)
    override func sceneDidLoad() {
        self.setUpScene()
    }
    #else
    override func didMove(to view: SKView) {
        self.setUpScene()
    }
    #endif

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    // MARK: - GameBoardSpriteDelegate
    func gameBoardSprite(_ sprite: GameBoardSprite, didPressAtLocation pressLocation: GameBoardState.Location) {
        if session!.makeUserPlayerMove(location: pressLocation) {
            sprite.setCellAt(location: pressLocation, value: session!.userPlayer.chip)
        }
    }
    
    // MARK: - GameSessionDelegate
    
    func gameSession(_ session: GameSession, player: Player, didMoveTo location: GameBoardState.Location) {
        gameBoard!.setCellAt(location: location, value: player.chip)
    }

    func gameSession(_ session: GameSession, didWinForPlayer wonPlayer: Player) {
        // TODO: handle win and reset
        print("player won: \(wonPlayer.chip)")
    }

    func gameSessionDidTie(_ session: GameSession) {
        print("end did tie")
    }

}

