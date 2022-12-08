//
//  Smart_DesignUITests.swift
//  Smart DesignUITests
//
//  Created by Nurlan Dadashbayli on 07.12.22.
//

import XCTest

final class Smart_DesignUITests: XCTestCase {
    var app = XCUIApplication()

    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
    }
    
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
}
