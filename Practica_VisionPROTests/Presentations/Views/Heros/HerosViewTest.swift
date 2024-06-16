//
//  HerosViewTest.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Practica_VisionPRO

final class HerosViewTest: XCTestCase {
    
    @Binding var selectedHero: Hero? = nil

    func testHerosView() throws {
        
        let view = HerosView(viewModel: HerosViewModel(useCaseHeros: HerosUseCaseFake()))
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.viewModel)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let rowView = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(rowView)
        
        let content = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(content)
    }
}

