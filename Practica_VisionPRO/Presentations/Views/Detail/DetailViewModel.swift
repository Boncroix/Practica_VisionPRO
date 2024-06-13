//
//  DetailViewModel.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import Foundation
import MarvelAppLibrary

// MARK: - DetailViewModel
final class DetailViewModel: ObservableObject {
    
    // MARK: Properties
    private let useCase: SeriesUseCaseProtocol
    
    @Published var seriesModel: SeriesEntry = SeriesEntryFake
    @Published var series: [Serie] = []
    @Published var status = Status.none
    
    // MARK: Init
    init(useCaseSeries: SeriesUseCaseProtocol = SeriesUseCase()) {
        self.useCase = useCaseSeries
    }
    
    // MARK: Public Functions
    @MainActor
    func getSeries(hero: Hero) {
        self.status = .loadingView
        
        Task {
            do {
                let (seriesEntryData, seriesData) = try await self.useCase.getSeries(hero: hero)
                self.seriesModel = seriesEntryData
                self.series = seriesData
                self.status = .home
            } catch {
                let errorMessage = errorMessage(for: error)
                self.status = .errorView(error: errorMessage)
                NSLog(errorMessage)
            }
        }
    }
}
