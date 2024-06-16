//
//  ErrorView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import SwiftUI
import MarvelAppLibrary

// MARK: - ErrorView
struct ErrorView: View {
    
    // MARK: Properties
    @Environment(\.colorScheme) var colorScheme
    var error: String
    var closure: (() -> Void)?

    // MARK: View
    var body: some View {
        ZStack {
            errorContent
        }
        .ignoresSafeArea()
    }
    
    // MARK: SubView
    private var errorContent: some View {
        ScreenSizeReader { screenSize in
            ZStack {
                Image(.marvelCrash)
                    .resizable()
                
                LinearGradient(
                    colors: [AppColors(colorScheme: colorScheme).whiteBlack, .clear],
                    startPoint: .bottom,
                    endPoint: .top
                    )
                
                VStack {
                    
                    Spacer()
                    
                    Text("\(error)")
                        
                    Divider()
                        .frame(height: 3)
                        .overlay(.red)
                        
                    Button(NSLocalizedString("Close", comment: "")) {
                        closure?()
                    }
                    .padding(8)
                    .background(AppColors().KCorange)
                    .cornerRadius(50)
                    .opacity(0.9)
                    
                }
                .padding()
                .font(AppFonts().textM)
                .foregroundColor(.red)
                .bold()
                
            }
            .frame(width: screenSize.width - 16, height: screenSize.height / 3)
            .cornerRadius(50)
            .shadow(radius: 10)
        }
    }
}

#Preview {
    ErrorView(error: "Test Error")
}


