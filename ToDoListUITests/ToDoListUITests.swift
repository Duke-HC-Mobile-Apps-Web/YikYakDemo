//
//  ToDoListUITests.swift
//  ToDoListUITests
//
//  Created by Davis Gossage on 2/1/16.
//  Copyright © 2016 Davis Gossage. All rights reserved.
//

import XCTest

class ToDoListUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTableExists() {
        let app = XCUIApplication()
        let table = app.tables.element
        
        XCTAssertTrue(table.exists)
    }
    
    func testAddingItem() {
        
        let app = XCUIApplication()
        app.navigationBars["ToDo List"].buttons["Compose"].tap()
        
        let whatDoYouNeedToDoTextField = app.textFields["What do you need to do?"]
        whatDoYouNeedToDoTextField.tap()
        whatDoYouNeedToDoTextField.typeText("1st test")

        
        let secondaryTextField = app.textFields.elementBoundByIndex(1)
        secondaryTextField.tap()
        secondaryTextField.tap()
        secondaryTextField.typeText("detail test")
        
        app.navigationBars["Title"].buttons["Save"].tap()
        
        
        let table = app.tables.element
        let cell = table.cells.elementBoundByIndex(2)
        XCTAssertTrue(cell.exists, "Could not add a cell to the table")
        let indexedText = cell.staticTexts.element
        XCTAssertTrue(indexedText.exists)
        let primaryText = cell.staticTexts.elementBoundByIndex(0).label
        XCTAssertTrue(primaryText == "1st test", "Table cell's textLabel was not correct.  found instead: \(primaryText)")
        
        let secondaryText = cell.staticTexts.elementBoundByIndex(1).label
        XCTAssertTrue(secondaryText == "detail test", "Table cell's detailTextLabel was not correct.  found instead: \(secondaryText)")
        
    }
    
    func tapElementAndWaitForKeyboardToAppear(element: XCUIElement) {
        let keyboard = XCUIApplication().keyboards.element
        while (true) {
            element.tap()
            if keyboard.exists {
                break;
            }
            NSRunLoop.currentRunLoop().runUntilDate(NSDate(timeIntervalSinceNow: 0.5))
        }
    }
    
}
