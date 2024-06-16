//
//  MainViewTest.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Practica_VisionPRO

final class MainViewTest: XCTestCase {

    func testMainView() throws {
        
        let view = MainView()
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let tabView = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(tabView)
        
        let view1 = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(view1)
        
        let view2 = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(view2)
        
        let sound = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(sound)
    }
}
