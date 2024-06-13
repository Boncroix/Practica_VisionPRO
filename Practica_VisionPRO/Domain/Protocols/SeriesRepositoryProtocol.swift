//
//  SeriesRepositoryProtocol.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import Foundation
import MarvelAppLibrary

// MARK: - SeriesRepositoryProtocol
protocol SeriesRepositoryProtocol {
    func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie])
}

