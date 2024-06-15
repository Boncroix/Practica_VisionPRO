//
//  HerosRepositoryProtocol.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import Foundation
import MarvelAppLibrary

// MARK: - HerosRepositoryProtocol
protocol HerosRepositoryProtocol {
    func getHeros() async throws -> (HerosEntry, [Hero])
    func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie])
}
