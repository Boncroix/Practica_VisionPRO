//
//  HerosVIewModel.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import Foundation
import MarvelAppLibrary

// MARK: - HerosViewModel
@Observable
final class HerosViewModel: ViewModelProtocol {
    
    // MARK: Properties
    private let useCaseHeros: HerosUseCaseProtocol
    var status = Status.none
    var herosModel: HerosEntry = herosEntryFake
    var heros: [Hero] = []
    
    // MARK: Init
    init(useCaseHeros: HerosUseCaseProtocol = HerosUseCase()) {
        self.useCaseHeros = useCaseHeros
        getHeros()
    }
    
    // MARK: Public Functions
    func getHeros() {
        self.status = .loading
        DispatchQueue.main.async {
            Task {
                do {
                    let (herosEntryData, herosData) = try await self.useCaseHeros.getHeros()
                    self.herosModel = herosEntryData
                    self.heros = herosData
                    self.status = .loaded
                } catch {
                    let errorMessage = errorMessage(for: error)
                    self.status = .error(error: errorMessage)
                    NSLog(errorMessage)
                }
            }
        }
    }
}
