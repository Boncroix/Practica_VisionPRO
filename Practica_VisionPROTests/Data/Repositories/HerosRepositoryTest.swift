//
//  HerosRepositoryTest.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Practica_VisionPRO

final class HerosRepositoryTest: XCTestCase {

    private var sut: HerosRepository!
    private var herosEntry: HerosEntry!
    private var heroes: [Hero]!
    
    override func setUpWithError() throws {
        sut = HerosRepository(network: NetworkHerosFake())
        XCTAssertNotNil(sut)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        herosEntry = nil
        heroes = nil
    }
    
    func testGetHeroes() async throws {
        //When
        let expectation = XCTestExpectation(description: "Get Heros")
        (herosEntry, heroes) = try await sut.getHeros()
        XCTAssertNotNil(herosEntry)
        XCTAssertNotNil(heroes)
        
        //Then
        _ = await XCTWaiter().fulfillment(of: [expectation], timeout: 3)
        XCTAssertEqual(heroes.count, 2)
        XCTAssertEqual(heroes.first?.name, "Hulk")
    }
}
