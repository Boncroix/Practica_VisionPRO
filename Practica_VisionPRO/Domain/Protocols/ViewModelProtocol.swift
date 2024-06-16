//
//  ViewModelProtocol.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 14/6/24.
//

import Foundation

// MARK: - ViewModel Protocol
protocol ViewModelProtocol {
    var status: Status {get}
    func resetStatus()
}
