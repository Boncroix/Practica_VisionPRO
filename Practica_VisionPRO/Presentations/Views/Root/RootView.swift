//
//  RootView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import SwiftUI

// MARK: - RootView
struct RootView: View {
    
    // MARK: Properties
    @StateObject var viewModel: HerosViewModel
        
    // MARK: View
    var body: some View {
        switch viewModel.status {
        case .none:
            Text("Status none")
                .onAppear {
                    viewModel.getHeros()
                }
        case .loadingView:
            LoadingView()
        case .home:
            HerosListView(viewModel: viewModel)
        case .errorView(error: let errorString):
            ErrorView(error: errorString) {
                viewModel.status = .none
            }
        }
    }
}


// MARK: - Preview
#Preview {
    RootView(viewModel: HerosViewModel())
}

