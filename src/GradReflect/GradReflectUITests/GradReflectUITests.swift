//
//  GradReflectUITests.swift
//  GradReflectUITests
//
//  Created by Gemma McDonald on 29/10/2020.
//

import XCTest

class GradReflectUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }


    func testAddsNoteToList() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Notes"].tap()
        app.navigationBars["My Notes 📘"].buttons["note.text.badge.plus"].tap()
        
        let tablesQuery2 = app.tables
        let tablesQuery = tablesQuery2
        let noteNameField = tablesQuery.textFields["noteNameTextField"]
        noteNameField.tap()
        
        noteNameField.typeText("Test")
        tablesQuery2.cells["Situation"].swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["saveNoteButton"]/*[[".cells[\"Save Note\"]",".buttons[\"Save Note\"]",".buttons[\"saveNoteButton\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssert(app.tables.staticTexts["Test"].exists)
        

    }
    
    func testDelete() {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Notes"].tap()
        
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
              
        XCTAssertFalse(app.tables.staticTexts["Make cool app"].exists)
    }

}

