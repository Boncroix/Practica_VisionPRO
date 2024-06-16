//
//  SeriesRepositoryTest.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Practica_VisionPRO

final class SeriesRepositoryTest: XCTestCase {

    private var sut: SeriesRepository!
    private var seriesEntry: SeriesEntry!
    private var series: [Serie]!
    
    override func setUpWithError() throws {
        sut = SeriesRepository(network: NetworkSeriesFake())
        XCTAssertNotNil(sut)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        seriesEntry = nil
        series = nil
    }
    
    func testGetSeries() async throws {
        //When
        let expectation = XCTestExpectation(description: "Get Series")
        (seriesEntry, series) = try await sut.getSeries(hero: character1)
        XCTAssertNotNil(seriesEntry)
        XCTAssertNotNil(series)
        
        //Then
        _ = await XCTWaiter().fulfillment(of: [expectation], timeout: 3)
        XCTAssertEqual(series.count, 2)
        XCTAssertEqual(series.last?.title, "Jackpot (2024)")
    }
}
