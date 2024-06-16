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
        
        ZStack {
            Image(.marvelCrash)
                .resizable()
                .id(0)
            
            LinearGradient(
                colors: [.black, .clear],
                startPoint: .bottom,
                endPoint: .top
                )
            .id(1)
            
            VStack {
                
                Spacer()
                
                Text("\(error)")
                    .id(2)
                    
                Divider()
                    .frame(height: 3)
                    .overlay(.red)
                    .id(3)
                    
                Button(NSLocalizedString("Close", comment: "")) {
                    closure?()
                }
                .padding(8)
                .background(AppColors().KCorange)
                .cornerRadius(50)
                .opacity(0.9)
                .id(4)
                
            }
            .padding()
            .font(AppFonts().textM)
            .foregroundColor(.red)
            .bold()
            
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .cornerRadius(50)
        .shadow(radius: 10)

    }
}

#Preview {
    ErrorView(error: "Test Error View")
}


