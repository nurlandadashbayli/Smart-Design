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
    
    func testAddDesign() throws {
        let app = XCUIApplication()
        app.launch()
        
        let swiftuiModifiedcontentSmartDesignHomeviewSwiftuiEnvironmentkeywritingmodifierCNsmanagedobjectcontext1Appwindow1Window = XCUIApplication()/*@START_MENU_TOKEN@*/.windows["SwiftUI.ModifiedContent<Smart_Design.HomeView, SwiftUI._EnvironmentKeyWritingModifier<__C.NSManagedObjectContext>>-1-AppWindow-1"]/*[[".windows[\"Smart Design\"]",".windows[\"SwiftUI.ModifiedContent<Smart_Design.HomeView, SwiftUI._EnvironmentKeyWritingModifier<__C.NSManagedObjectContext>>-1-AppWindow-1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        swiftuiModifiedcontentSmartDesignHomeviewSwiftuiEnvironmentkeywritingmodifierCNsmanagedobjectcontext1Appwindow1Window.toolbars.children(matching: .button)["Add"].children(matching: .button)["Add"].click()
        swiftuiModifiedcontentSmartDesignHomeviewSwiftuiEnvironmentkeywritingmodifierCNsmanagedobjectcontext1Appwindow1Window/*@START_MENU_TOKEN@*/.tables.cells.containing(.button, identifier:"10x20").element/*[[".splitGroups[\"SwiftUI.ModifiedContent<Smart_Design.HomeView, SwiftUI._EnvironmentKeyWritingModifier<__C.NSManagedObjectContext>>-1-AppWindow-1, SidebarNavigationSplitView\"]",".groups",".scrollViews.tables",".tableRows.cells.containing(.button, identifier:\"10x20\").element",".cells.containing(.button, identifier:\"10x20\").element",".tables"],[[[-1,5,3],[-1,2,3],[-1,1,2],[-1,0,1]],[[-1,5,3],[-1,2,3],[-1,1,2]],[[-1,5,3],[-1,2,3]],[[-1,4],[-1,3]]],[0,0]]@END_MENU_TOKEN@*/.typeText("Title\t5\t5")
        swiftuiModifiedcontentSmartDesignHomeviewSwiftuiEnvironmentkeywritingmodifierCNsmanagedobjectcontext1Appwindow1Window.sheets/*@START_MENU_TOKEN@*/.buttons["Add"]/*[[".groups.buttons[\"Add\"]",".buttons[\"Add\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.click()
    }
}
