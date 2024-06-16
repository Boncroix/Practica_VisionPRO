//
//  TestSubViews.swift
//  Practica_VisionPROTests
//
//  Created by Jose Bueno Cruz on 16/6/24.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Practica_VisionPRO

final class SubPlaceHolderImageTest: XCTestCase {
    
    // MARK: - testPlaceHolderImage
    func testPlaceHolderImage() throws {
        let view = PlaceHolderImage()
        XCTAssertNotNil(view)
        
        let numItems = try view.inspect().count
        XCTAssertEqual(numItems, 1)
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
    }
}

/*
struct TestView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.title)
                .foregroundColor(.blue)
        }
        .frame(width: 400, height: 200)
    }
}

final class ScreenSizeReaderUITests: XCTestCase {
    var width: CGFloat = 0.0
    var height: CGFloat = 0.0
    var view: ScreenSizeReader<TestView>!

    override func setUp() {
        super.setUp()
        view = ScreenSizeReader { screenSize in
            TestView()
                .onAppear {
                    self.width = screenSize.width
                    self.height = screenSize.height
                } as! TestView
        }
    }

    func testScreenSize() {
        // Simulate the view's appearance
        view.onAppear()

        // Assert the expected values
        XCTAssertEqual(width, 400)
        XCTAssertEqual(height, 200)
    }
}

*/
