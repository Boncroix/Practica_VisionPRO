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
    var viewModel: SeriesViewModel
    
    init(viewModel: SeriesViewModel) {
        self.viewModel = viewModel
    }
    
    
    // MARK: View
    var body: some View {

        ScrollView {
            ForEach(viewModel.series) { serie in
                SeriesRowView(serie: serie)
            }
            .navigationTitle("Series")
        }
    }
}

/*
 // MARK: - SeriesPreview
 #Preview {
     SeriesView(viewModel: SeriesViewModel(hero: character1))
 }
 */
