//
//  Practica_VisionPROApp.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import SwiftUI

// MARK: - Main
@main
struct Practica_VisionPROApp: App {
    
    // MARK: View
    var body: some Scene {
        
        // MARK: Windows
        WindowGroup {
            MainView()
                .frame(minWidth: 1000, maxWidth: 2000, minHeight: 800, maxHeight: 1600)
        }
        .windowStyle(.plain)
        .windowResizability(.contentMinSize)
    }
}
