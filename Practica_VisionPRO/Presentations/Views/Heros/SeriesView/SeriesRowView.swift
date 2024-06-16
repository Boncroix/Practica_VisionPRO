//
//  SeriesRowView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 13/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - SeriesRowView
struct SeriesRowView: View {
    
    // MARK: Properties
    let serie: Serie
    
    // MARK: View
    var body: some View {
        
        ZStack {
            if let urlString = serie.thumbnail.getUrlImage(), let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                } placeholder: {
                    PlaceHolderImage()
                }
                .id(0)
            } else {
                PlaceHolderImage()
                    .id(1)
            }
            
            LinearGradient(
                colors: [Color.black, .clear],
                startPoint: .bottom,
                endPoint: .center
            )
            .id(2)
            
            VStack {
                
                Spacer()
                
                Text(serie.title)
                    .font(AppFonts().textXL)
                    .bold()
                    .padding()
                    .foregroundStyle(Color.white)
                    .id(3)
            }
        }
        .cornerRadius(50)
        .shadow(radius: 10)
    }
}

// MARK: - Preview SeriesRowView
#Preview {
    SeriesRowView(serie: serie1)
}
