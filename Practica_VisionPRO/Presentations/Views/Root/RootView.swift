//
//  RootView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 14/6/24.
//

import SwiftUI

// MARK: - RootView
struct RootView<T: ViewModelProtocol, ContentView: View>: View {
    
    // MARK: Properties
    var viewModel: T
    let viewDestination: ContentView
    
    // MARK: View
    var body: some View {
        ZStack{
            VStack{
                switch (viewModel.status){
                case .none:
                    Text("None")
                        .id(0)
                case .error(error: let errorString):
                    ErrorView(error: errorString) {
                        viewModel.resetStatus()
                    }
                    .id(1)
                case .loaded:
                    viewDestination
                        .id(2)
                case .loading:
                    LoadingView()
                        .id(3)
                }
            }
        }
    }
}

// MARK: - Preview Rootview
#Preview {
    RootView(viewModel: HerosViewModel(useCaseHeros: HerosUseCaseFake()), viewDestination: HerosView())
}
