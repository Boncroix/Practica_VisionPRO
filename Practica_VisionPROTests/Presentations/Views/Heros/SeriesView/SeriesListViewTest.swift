//
//  SeriesListViewTest.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Practica_VisionPRO

final class SeriesListViewTest: XCTestCase {
    
    func testSeriesListview() throws {
        
        let view = SeriesListView(viewModel: SeriesViewModel(useCaseSeries: SeriesUseCaseFake(), hero: character1))
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.viewModel)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let scrollView = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(scrollView)
        
        let rowView = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(rowView)
    }
}
