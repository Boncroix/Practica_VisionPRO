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
        Text("Pantalla error")
    }
}

#Preview {
    ErrorView(error: "Test Error")
}
