//
//  GameBoardStateTests.swift
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
