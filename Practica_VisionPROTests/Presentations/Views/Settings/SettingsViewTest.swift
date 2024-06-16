//
//  SettingsViewTest.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Practica_VisionPRO

final class SettingsViewTest: XCTestCase {
    
    func testSettingsView() throws {
        let view = SettingsView()
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let text = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(text)
        
        let text1 = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text1)
        
        let text2 = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(text2)
    }
    
}
