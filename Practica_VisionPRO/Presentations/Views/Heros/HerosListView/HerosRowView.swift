//
//  HerosRowView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 13/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - HerosRowView
struct HerosRowView: View {
    
    // MARK: Properties
    let hero: Hero
    
    // MARK: View
    var body: some View {
        ZStack {
            if let urlString = hero.thumbnail.getUrlImage(), let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                } placeholder: {
                    PlaceHolderImage()
                }
                .id(0)
            } else {
                PlaceHolderImage()
            }
            
            LinearGradient(
                colors: [Color.black, .clear],
                startPoint: .bottom,
                endPoint: .center
                )
            .id(1)
            
            VStack {
                
                Spacer()
                
                Text(hero.name)
                    .font(AppFonts().textM)
                    .bold()
                    .padding()
                    .foregroundStyle(Color.white)
                    .id(2)
            }
        }
        .cornerRadius(50)
        .shadow(radius: 10)
    }}

// MARK: - Preview
#Preview {
    HerosRowView(hero: character2)
}
