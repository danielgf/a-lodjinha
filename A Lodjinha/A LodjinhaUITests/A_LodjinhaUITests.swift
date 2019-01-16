//
//  A_LodjinhaUITests.swift
//  A LodjinhaUITests
//
//  Created by Daniel Griso Filho on 1/11/19.
//  Copyright © 2019 Daniel Griso Filho. All rights reserved.
//

import XCTest

class A_LodjinhaUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testScrollView() {
        let scrollView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .scrollView).element
        scrollView.swipeLeft()
        scrollView.swipeRight()
    }
    
    func testCollectionView() {
        let cellsQuery = app.collectionViews.cells
        cellsQuery.otherElements.containing(.staticText, identifier:"Games").element.tap()
        app.navigationBars["Games"].buttons["Home"].tap()
    }

}
