//
//  HerosViewModelTest.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Practica_VisionPRO

final class HerosViewModelTest: XCTestCase {
    
    private var sut: HerosViewModel!
    
    override func setUpWithError() throws {
        sut = HerosViewModel(useCaseHeros: HerosUseCaseFake())
        XCTAssertNotNil(sut)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testHerosViewModel() async throws {
        // Given
        let expectation = XCTestExpectation(description: "Get Heros")
        
        // When
        XCTAssertNoThrow(sut.getHeros())
        XCTAssertEqual(sut.status, .loading)
        
        // Then
        _ = await XCTWaiter().fulfillment(of: [expectation], timeout: 3)
        XCTAssertEqual(sut.status, .loaded)
        XCTAssertEqual(sut.heros.count, 2)
        XCTAssertEqual(sut.heros.first?.name, "Hulk")
        
        // Given
        let expectation1 = XCTestExpectation(description: "Get Heros")
        
        // When
        XCTAssertNoThrow(sut.resetStatus())
        XCTAssertEqual(sut.status, .loading)
        
        // Then
        _ = await XCTWaiter().fulfillment(of: [expectation1], timeout: 3)
        XCTAssertEqual(sut.status, .loaded)
        XCTAssertEqual(sut.heros.count, 2)
        XCTAssertEqual(sut.heros.last?.name, "Iron Man")
    }
}
