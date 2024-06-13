//
//  HerosRepository.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import Foundation
import MarvelAppLibrary

// MARK: - HeroeRepository
final class HerosRepository: HerosRepositoryProtocol {
    
    // MARK: Properties
    private var network: NetworkHerosProtocol
    
    // MARK: Init
    init(network: NetworkHerosProtocol = NetworkHeros()) {
        self.network = network
    }
    
    // MARK: Functions
    func getHeros() async throws -> (HerosEntry, [Hero]) {
        try await network.getHeros()
    }
}

// MARK: - HerosRepositoryFake
final class HerosRepositoryFake: HerosRepositoryProtocol {
    
    // MARK: Properties
    private var network: NetworkHerosProtocol
    
    // MARK: Init
    init(network: NetworkHerosProtocol = NetworkHerosFake()) {
        self.network = network
    }
    
    // MARK: Functions
    func getHeros() async throws -> (HerosEntry, [Hero]) {
        try await network.getHeros()
    }
}
