//
//  GradReflectUITests.swift
//  GradReflectUITests
//
//  Created by Gemma McDonald on 29/10/2020.
//

import XCTest


/*
 UI test class to determine that a note can be created and that a note can be deleted
 */
class GradReflectUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }
    
    func testAddsNoteToList() {
        
        // Launch app
        let app = XCUIApplication()
        app.launch()
        
        // Go to notes section
        app.buttons["Notes"].tap()
        // Click to add a new note
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].children(matching: .button).element.tap()
        
        // Enter a note with the title 'Test'
        let tablesQuery = app.tables
        let noteNameField = tablesQuery.textFields["noteNameTextField"]
        noteNameField.tap()
        noteNameField.typeText("Test Note Adds to List")
        
        // Save the note
        app/*@START_MENU_TOKEN@*/.tables.containing(.cell, identifier:"Graduate Attribute").element/*[[".tables.containing(.cell, identifier:\"Cancel Note\").element",".tables.containing(.cell, identifier:\"Future Actions\").element",".tables.containing(.cell, identifier:\"Behaviour\").element",".tables.containing(.cell, identifier:\"Cause of emotions\").element",".tables.containing(.cell, identifier:\"Value: 1\").element",".tables.containing(.cell, identifier:\"hand.thumbsdown, hand.thumbsup\").element",".tables.containing(.cell, identifier:\"Thoughts\").element",".tables.containing(.cell, identifier:\"Situation\").element",".tables.containing(.cell, identifier:\"Graduate Attribute\").element"],[[[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["saveNoteButton"]/*[[".cells[\"Save Note\"]",".buttons[\"Save Note\"]",".buttons[\"saveNoteButton\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Check that the note with title 'Test' exists
        XCTAssert(app.tables.staticTexts["Test Note Adds to List"].exists)
        
        // This note will remain in list until it is manually deleted
    }
    
    func testDeletion() {
        
        // Launch app
        let app = XCUIApplication()
        app.launch()
        
        // Got to notes section and create a note with title 'To Delete'
        app.buttons["Notes"].tap()
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].children(matching: .button).element.tap()
        let tablesQuery2 = app.tables
        let tablesQuery = tablesQuery2
        let noteNameField = tablesQuery.textFields["noteNameTextField"]
        noteNameField.tap()
        noteNameField.typeText("To Delete")
        app/*@START_MENU_TOKEN@*/.tables.containing(.cell, identifier:"Graduate Attribute").element/*[[".tables.containing(.cell, identifier:\"Cancel Note\").element",".tables.containing(.cell, identifier:\"Future Actions\").element",".tables.containing(.cell, identifier:\"Behaviour\").element",".tables.containing(.cell, identifier:\"Cause of emotions\").element",".tables.containing(.cell, identifier:\"Value: 1\").element",".tables.containing(.cell, identifier:\"hand.thumbsdown, hand.thumbsup\").element",".tables.containing(.cell, identifier:\"Thoughts\").element",".tables.containing(.cell, identifier:\"Situation\").element",".tables.containing(.cell, identifier:\"Graduate Attribute\").element"],[[[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["saveNoteButton"]/*[[".cells[\"Save Note\"]",".buttons[\"Save Note\"]",".buttons[\"saveNoteButton\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Enter edit mode and click to delete the note with that title 'To Delete'
        let toolbar = app.toolbars["Toolbar"]
        toolbar.buttons["Edit"].tap()
        tablesQuery2.cells.containing(.staticText, identifier: "To Delete").buttons["Delete "].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete"]/*[[".cells[\"To Delete, 06\/04\/21, 12:44\"].buttons[\"Delete\"]",".buttons[\"Delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        toolbar.buttons["Done"].tap()
        
        // Check that a note with the title 'To Delete' does not exist
        XCTAssertFalse(app.tables.staticTexts["To Delete"].exists)
        
    }

}

