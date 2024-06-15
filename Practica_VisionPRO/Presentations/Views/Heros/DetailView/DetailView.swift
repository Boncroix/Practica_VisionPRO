//
//  DetailView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import SwiftUI
import MarvelAppLibrary

struct DetailView: View {
    
    var selectedhero: Hero?
    
    var body: some View {
        
        VStack {
            if let hero = selectedhero {
                NavigationStack {
                    VStack(spacing: 16) {
                        if let urlString = hero.thumbnail.getUrlImage(), let url = URL(string: urlString) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .cornerRadius(50)
                                    .frame(minHeight: 400)
                            } placeholder: {
                                PlaceHolderImage()
                            }
                        } else {
                            PlaceHolderImage()
                        }
                        
                        ScrollView {
                            Text(hero.description)
                        }
                    }
                }
                .navigationTitle(hero.name)
                .cornerRadius(50)
            } else {
                ContentUnavailableView("Selectiona un heroe",
                                       systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    DetailView(selectedhero: character1)
}
