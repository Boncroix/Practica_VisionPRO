//
//  SeriesViewModelTest.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Practica_VisionPRO

final class SeriesViewModelTest: XCTestCase {
    
    private var sut: SeriesViewModel!
    
    override func setUpWithError() throws {
        sut = SeriesViewModel(useCaseSeries: SeriesUseCaseFake(), hero: character1)
        XCTAssertNotNil(sut)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSeriesViewModel() async throws {
        // Given
        let expectation = XCTestExpectation(description: "Get Series")
        
        // When
        XCTAssertNoThrow(sut.getSeries(hero: character1))
        XCTAssertEqual(sut.status, .loading)
        
        // Then
        _ = await XCTWaiter().fulfillment(of: [expectation], timeout: 3)
        XCTAssertEqual(sut.status, .loaded)
        XCTAssertEqual(sut.series.count, 2)
        XCTAssertEqual(sut.series.first?.title, "Spider-Man Unlimited Infinity Comic (2023 - Present)")
        
        // Given
        let expectation1 = XCTestExpectation(description: "Get Series")
        
        // When
        XCTAssertNoThrow(sut.resetStatus())
        XCTAssertEqual(sut.status, .loading)
        
        // Then
        _ = await XCTWaiter().fulfillment(of: [expectation1], timeout: 3)
        XCTAssertEqual(sut.status, .loaded)
        XCTAssertEqual(sut.series.count, 2)
        XCTAssertEqual(sut.series.last?.title, "Jackpot (2024)")
    }
}
