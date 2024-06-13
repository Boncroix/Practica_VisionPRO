//
//  Status.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import Foundation

// MARK: - Enum AppState
enum Status {
    case none,
         home,
         loadingView,
         errorView(error: String)
}
