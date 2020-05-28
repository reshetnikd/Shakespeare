//
//  ShakespeareTests.swift
//  ShakespeareTests
//
//  Created by Dmitry Reshetnik on 28.05.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import XCTest
@testable import Shakespeare

class ShakespeareTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAllWordsLoaded() {
        let playData = PlayData()
        XCTAssertEqual(playData.allWords.count, 0, "allWords must be 0")
    }

}
