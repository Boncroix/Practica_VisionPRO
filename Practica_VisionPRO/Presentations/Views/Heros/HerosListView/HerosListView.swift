//
//  HerosListView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 15/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - HerosListView
struct HerosListView: View {
    
    // MARK: Properties
    @State var viewModel: HerosViewModel
    @Binding var selectedHero: Hero?
    
    // MARK: View
    var body: some View {
        List(selection: $selectedHero) {
            ForEach(viewModel.heros) { data in
                NavigationLink(value: data) {
                    HerosRowView(hero: data)
                }
                .tag(data)
            }
        }
        .navigationTitle("Heroes")
    }
}

// MARK: - Preview HerosListView
#Preview {
    struct PreviewWrapper: View {
        @State private var selectedHero: Hero? = nil
        @State private var viewModel = HerosViewModel(useCaseHeros: HerosUseCaseFake())
        
        var body: some View {
            HerosListView(viewModel: viewModel, selectedHero: $selectedHero)
        }
    }
    
    return PreviewWrapper()
}
