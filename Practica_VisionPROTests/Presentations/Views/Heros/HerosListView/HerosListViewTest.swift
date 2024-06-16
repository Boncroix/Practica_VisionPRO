//
//  HerosListViewTest.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Practica_VisionPRO

final class HerosListViewTest: XCTestCase {
    
    @Binding var selectedHero: Hero? = nil
    @State var viewModel = HerosViewModel(useCaseHeros: HerosUseCaseFake())
    
    func testHerosListViewTest() throws {
        
        let view = HerosListView(viewModel: viewModel, selectedHero: $selectedHero)
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.viewModel)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let list = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(list)
        
        let rowView = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(rowView)
    }
}
