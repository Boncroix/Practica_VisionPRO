//
//  SettingsView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 15/6/24.
//

import SwiftUI
import MarvelAppLibrary

struct SettingsView: View {
    var body: some View {
        ScreenSizeReader { screenSize in

            VStack {
                Spacer()
                
                Image("KeepCoding-Logo")
                
                Text("Versión 1.0")
                    .font(AppFonts().textL)
                
                Text("Mi primer proyecto Visión Pro")
                    .font(AppFonts().textM)
                
                Text("El primer paso para superar cualquier obstáculo es creer que puedes hacerlo.")
                    .font(AppFonts().textS)
                
                Spacer()
            }
            .frame(width: screenSize.width, height: screenSize.height)
            .cornerRadius(50)
        }

    }
}

#Preview {
    SettingsView()
}
