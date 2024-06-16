//
//  TestLoadingView.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Practica_VisionPRO

class LoadingViewTests: XCTestCase {
    
    func testLoadingView() throws {
        let view = LoadingView()
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
    }
}
