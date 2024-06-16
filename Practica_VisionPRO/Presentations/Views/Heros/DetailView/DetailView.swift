//
//  DetailView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - DetailView
struct DetailView: View {
    
    // MARK: Properties
    let selectedhero: Hero?
    
    // MARK: View
    var body: some View {
        if let hero = selectedhero {
            ScreenSizeReader { screenSize in
                NavigationStack {
                    VStack(spacing: 16) {
                        if let urlString = hero.thumbnail.getUrlImage(), let url = URL(string: urlString) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .cornerRadius(50)
                                    .frame(width: screenSize.width - 16, height: screenSize.height / 2)
                            } placeholder: {
                                PlaceHolderImage()
                            }
                            .id(0)
                        } else {
                            PlaceHolderImage()
                        }
                        
                        ScrollView {
                            Text(hero.description)
                                .id(1)
                        }
                    }
                }
                .navigationTitle(hero.name)
                .cornerRadius(50)
            }
        } else {
            ContentUnavailableView("Selectiona un heroe",
                                   systemImage: "person.fill")
        }
    }
}

// MARK: - Preview DetailView
#Preview {
    DetailView(selectedhero: character1)
}
