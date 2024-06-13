//
//  ErrorView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import SwiftUI

struct ErrorView: View {
    
    // MARK: Properties
    var error: String
    var clousure: (() -> Void)?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ErrorView(error: "Test Error")
}
