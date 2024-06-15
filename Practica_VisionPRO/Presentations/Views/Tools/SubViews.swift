//
//  SubViews.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - PlaceHolderImage
struct PlaceHolderImage: View {
    
    // MARK: Propreties
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: View
    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .foregroundColor(Color.black)
            .cornerRadius(50)
    }
}

// MARK: - ScreenSizeReader
struct ScreenSizeReader<Content: View>: View {
    var content: (CGSize) -> Content

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            content(size)
                .frame(width: size.width, height: size.height)
        }
    }
}

// MARK: - Preview
#Preview {
    PlaceHolderImage()
}
