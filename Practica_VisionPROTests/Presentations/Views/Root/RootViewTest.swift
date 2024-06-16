//
//  RootViewTest.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
import MarvelAppLibrary
@testable import Practica_VisionPRO

final class RootViewTest: XCTestCase {
     
    func testRootView() throws {
        
        let view = RootView(viewModel: HerosViewModel(useCaseHeros: HerosUseCaseFake()), viewDestination: HerosView())
        XCTAssertNotNil(view)
        XCTAssertNotNil(view.viewModel)
        XCTAssertNotNil(view.viewDestination)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let text = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(text)
        
        let errorView = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(errorView)
        
        let loadingView = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(loadingView)
        
        view.viewModel.status = .loaded
        
        let viewDestination = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(viewDestination)
        
        
        
    }
}
