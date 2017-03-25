//
//  GameBoardStateTests.swift
//  Crosses
//
//  Created by Sasmito Adibowo on 25/3/17.
//  Copyright © 2017 Basil Salad Software. All rights reserved.
//

import XCTest
@testable import Crosses

class GameBoardStateTests: XCTestCase {
    
    func testWinHorizontal() {
        let cell = GameBoardState.Cell.playerX
        var testObject = GameBoardState()
        
        testObject[.init(column: 0, row: 0)] = cell
        testObject[.init(column: 1, row: 0)] = cell
        testObject[.init(column: 2, row: 0)] = cell

        XCTAssertEqual(testObject.scoreFor(playerCell: cell), 3,"Score mismatch")
        XCTAssertTrue(testObject.isWin(playerCell: cell), "Wrong winning")
        XCTAssertFalse(testObject.isWin(playerCell: .playerO),"Wrong losing")
    }

    func testWinVertical() {
        let cell = GameBoardState.Cell.playerX
        var testObject = GameBoardState()
        
        testObject[.init(column: 1, row: 0)] = cell
        testObject[.init(column: 1, row: 1)] = cell
        testObject[.init(column: 1, row: 2)] = cell
        
        XCTAssertEqual(testObject.scoreFor(playerCell: cell), 3,"Score mismatch")
        XCTAssertTrue(testObject.isWin(playerCell: cell), "Wrong winning")
        XCTAssertFalse(testObject.isWin(playerCell: .playerO),"Wrong losing")
    }

    func testWinDiagonal1() {
        let cell = GameBoardState.Cell.playerX
        var testObject = GameBoardState()
        
        testObject[.init(column: 0, row: 0)] = cell
        testObject[.init(column: 1, row: 1)] = cell
        testObject[.init(column: 2, row: 2)] = cell
        
        XCTAssertEqual(testObject.scoreFor(playerCell: cell), 3,"Score mismatch")
        XCTAssertTrue(testObject.isWin(playerCell: cell), "Wrong winning")
        XCTAssertFalse(testObject.isWin(playerCell: .playerO),"Wrong losing")
    }

    func testWinDiagonal2() {
        let cell = GameBoardState.Cell.playerX
        var testObject = GameBoardState()
        
        testObject[.init(column: 0, row: 2)] = cell
        testObject[.init(column: 1, row: 1)] = cell
        testObject[.init(column: 2, row: 0)] = cell
        
        XCTAssertEqual(testObject.scoreFor(playerCell: cell), 3,"Score mismatch")
        XCTAssertTrue(testObject.isWin(playerCell: cell), "Wrong winning")
        XCTAssertFalse(testObject.isWin(playerCell: .playerO),"Wrong losing")
    }

    func testNoWinVertical() {
        let cell = GameBoardState.Cell.playerX
        var testObject = GameBoardState()
        
        testObject[.init(column: 1, row: 0)] = cell
        testObject[.init(column: 1, row: 1)] = cell
        
        XCTAssertEqual(testObject.scoreFor(playerCell: cell), 2,"Score mismatch")
        XCTAssertFalse(testObject.isWin(playerCell: cell), "Wrong winning")
        XCTAssertFalse(testObject.isWin(playerCell: .playerO),"Wrong losing")
    }

    func testNoWinHorizontal() {
        let cell = GameBoardState.Cell.playerX
        var testObject = GameBoardState()
        
        testObject[.init(column: 0, row: 0)] = cell
        testObject[.init(column: 1, row: 0)] = cell
        
        XCTAssertEqual(testObject.scoreFor(playerCell: cell), 2,"Score mismatch")
        XCTAssertFalse(testObject.isWin(playerCell: cell), "Wrong winning")
        XCTAssertFalse(testObject.isWin(playerCell: .playerO),"Wrong losing")
    }

}
