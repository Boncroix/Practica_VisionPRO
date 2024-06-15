//
//  HerosListView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: HerosView
struct HerosView: View {
    
    // MARK: Properties
    @State private var viewModel: HerosViewModel
    @State private var selectedHero: Hero?
    
    // MARK: Init
    init(viewModel: HerosViewModel = HerosViewModel()) {
        self.viewModel = viewModel
    }
    
    // MARK: View
    var body: some View {
        NavigationSplitView {
        
            RootView(viewModel: viewModel, viewDestination: HerosListView(selectedHero: $selectedHero))
                .padding(16)
            
        } content: {

            DetailView(selectedhero: selectedHero)
                .padding(16)
            
        } detail: {
            
            if let hero = selectedHero {
                let vm = SeriesViewModel(hero: hero)
                RootView(viewModel: vm,
                         viewDestination: SeriesListView(viewModel: vm))
                .padding(16)
            }
        }
    }
}

// MARK: - Preview Herosview
#Preview {
    HerosView(viewModel: HerosViewModel(useCaseHeros: HerosUseCaseFake()))
}

/*
 .ornament(attachmentAnchor: .scene(.bottom)) {
     HStack {
         Button(action: {
             
         }, label: {
             Image(systemName: "map")
                 .resizable()
                 .frame(width: 45, height: 45)
         })
         Button(action: {
             
         }, label: {
             Image(systemName: "gearshape")
                 .resizable()
                 .frame(width: 45, height: 45)
         })
     }
     .frame(width: 400, height: 80)
     .glassBackgroundEffect(in: .rect(cornerRadius: 40))
 }
 */
