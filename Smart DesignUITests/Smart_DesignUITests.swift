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
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunch() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
    }
    
    override func setUp() {
        
        super.setUp()
        self.app = XCUIApplication()
        self.app.launch()
    }
}
