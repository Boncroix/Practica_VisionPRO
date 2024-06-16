//
//  StatusTest.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Practica_VisionPRO

final class StatusTest: XCTestCase {

    func testStatus() throws {
        
        let status1 = Status.none
        XCTAssertNotNil(status1)
        let status2 = Status.loading
        XCTAssertNotNil(status2)
        let status3 = Status.loaded
        XCTAssertNotNil(status3)
        let status4 = Status.error(error: "Test Error")
        XCTAssertNotNil(status4)
        
        XCTAssertNotEqual(status1, status2)
        XCTAssertNotEqual(status1, status3)
        XCTAssertNotEqual(status1, status4)
        XCTAssertNotEqual(status2, status3)
        XCTAssertNotEqual(status2, status4)
        XCTAssertNotEqual(status3, status4)
        
    }
}
