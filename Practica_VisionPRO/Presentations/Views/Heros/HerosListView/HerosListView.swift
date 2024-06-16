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
        ScreenSizeReader { screenSize in
            List(selection: $selectedHero) {
                ForEach(viewModel.heros) { data in
                    NavigationLink(value: data) {
                        HerosRowView(hero: data)
                            .frame(width: screenSize.width - 16, height: screenSize.height / 3)
                    }.tag(data)
                }
                .id(1)
            }
            .navigationTitle("Heroes")
            .id(0)
        }
    }
}

// MARK: - Preview HerosListView
#Preview {
    struct PreviewWrapper: View {
        @State var selectedHero: Hero? = nil
        @State var viewModel = HerosViewModel(useCaseHeros: HerosUseCaseFake())
        
        var body: some View {
            HerosListView(viewModel: viewModel, selectedHero: $selectedHero)
        }
    }
    
    return PreviewWrapper()
}
