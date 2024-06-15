//
//  SeriesViewModel.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 15/6/24.
//

import Foundation
import MarvelAppLibrary

// MARK: - SeriesViewModel
@Observable
final class SeriesViewModel: ViewModelProtocol {
    
    // MARK: Properties
    private let useCase: SeriesUseCaseProtocol
    var status = Status.none
    var seriesModel: SeriesEntry = SeriesEntryFake
    var series: [Serie] = []
    var hero: Hero
    
    // MARK: Init
    init(useCaseSeries: SeriesUseCaseProtocol = SeriesUseCase(),
         hero: Hero) {
        self.useCase = useCaseSeries
        self.hero = hero
        getSeries(hero: hero)
    }
    
    // MARK: Functions
    func getSeries(hero: Hero) {
        self.status = .loading
        DispatchQueue.main.async {
            Task {
                do {
                    let (seriesEntryData, seriesData) = try await self.useCase.getSeries(hero: hero)
                    self.seriesModel = seriesEntryData
                    self.series = seriesData
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
