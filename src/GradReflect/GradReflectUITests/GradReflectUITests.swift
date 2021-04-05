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
        
        let app = XCUIApplication()
        app.launch()
        app.buttons["Notes"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].children(matching: .button).element.tap()
        
        let tablesQuery = app.tables
        let noteNameField = tablesQuery.textFields["noteNameTextField"]
        noteNameField.tap()
        
        noteNameField.typeText("Test")
        //app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app/*@START_MENU_TOKEN@*/.tables.containing(.cell, identifier:"Graduate Attribute").element/*[[".tables.containing(.cell, identifier:\"Cancel Note\").element",".tables.containing(.cell, identifier:\"Future Actions\").element",".tables.containing(.cell, identifier:\"Behaviour\").element",".tables.containing(.cell, identifier:\"Cause of emotions\").element",".tables.containing(.cell, identifier:\"Value: 1\").element",".tables.containing(.cell, identifier:\"hand.thumbsdown, hand.thumbsup\").element",".tables.containing(.cell, identifier:\"Thoughts\").element",".tables.containing(.cell, identifier:\"Situation\").element",".tables.containing(.cell, identifier:\"Graduate Attribute\").element"],[[[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
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
              
        XCTAssertFalse(app.tables.staticTexts["Test"].exists)
    }

}

