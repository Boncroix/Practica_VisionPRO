//
//  SeriesView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 13/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - SeriesView
struct SeriesListView: View {
    
    // MARK: Properties
    let viewModel: SeriesViewModel
    
    // MARK: Init
    init(viewModel: SeriesViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: View
    var body: some View {
        
        ScrollView {
            ForEach(viewModel.series) { serie in
                SeriesRowView(serie: serie)
                    .frame(height: 350)
                    .frame(maxWidth: 1050)
                    .padding(16)
            }
            .navigationTitle("Series")
            .id(1)
        }
        .id(0)
        
    }
}

 // MARK: - SeriesPreview
 #Preview {
     SeriesListView(viewModel: SeriesViewModel(useCaseSeries: SeriesUseCaseFake(), hero: character1))
 }
