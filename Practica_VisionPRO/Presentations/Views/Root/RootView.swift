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
    @Environment(\.openWindow) private var openWindow
    var viewModel: T
    let viewDestination: ContentView
    
    // MARK: View
    var body: some View {
        ZStack{
            VStack{
                switch (viewModel.status){
                case .none:
                    Text("None")
                case .error(error: let errorString):
                    ErrorView(error: errorString) {
                        viewModel.resetStatus()
                    }
                case .loaded:
                    viewDestination
                case .loading:
                    LoadingView()
                }
            }
        }
    }
}

// MARK: - Preview Rootview
#Preview {
    RootView(viewModel: HerosViewModel(useCaseHeros: HerosUseCaseFake()), viewDestination: HerosView())
}
