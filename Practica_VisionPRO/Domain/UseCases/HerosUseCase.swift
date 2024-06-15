//
//  HerosUseCase.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import Foundation
import MarvelAppLibrary

// MARK: - Protocol
protocol HerosUseCaseProtocol {
    var repository: HerosRepositoryProtocol {get set}
    func getHeros() async throws -> (HerosEntry, [Hero])
    func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie])
}

// MARK: - HerosUseCase
final class HerosUseCase: HerosUseCaseProtocol {
    
    // MARK: Properties
    var repository: any HerosRepositoryProtocol
    
    // MARK: Inits
    init(repository: HerosRepositoryProtocol = HerosRepository(network: NetworkHeros())) {
        self.repository = repository
    }
    
    // MARK: GetHeros
    func getHeros() async throws -> (HerosEntry, [Hero]) {
        return try await repository.getHeros()
    }
    
    // MARK: GetSeries
    func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie]) {
        return try await repository.getSeries(hero: hero)
    }
}

// MARK: - HerosUseCaseFake
final class HerosUseCaseFake: HerosUseCaseProtocol {
    
    // MARK: Properties
    var repository: HerosRepositoryProtocol
    
    // MARK: Inits
    init(repository: HerosRepositoryProtocol = HerosRepositoryFake(network: NetworkHerosFake())) {
        self.repository = repository
    }
    
    // MARK: GetHeros
    func getHeros() async throws -> (HerosEntry, [Hero]) {
        return try await repository.getHeros()
    }
    
    // MARK: GetSeries
    func getSeries(hero: Hero) async throws -> (SeriesEntry, [Serie]) {
        return try await repository.getSeries(hero: hero)
    }
}
