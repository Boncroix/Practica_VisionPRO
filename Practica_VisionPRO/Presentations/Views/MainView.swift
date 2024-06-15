//
//  MainView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 14/6/24.
//

import SwiftUI
import MarvelAppLibrary
import RealityKit
import RealityKitContent


// MARK: - MainView
struct MainView: View {
    
    // MARK: Views
    var body: some View {
        ZStack{
            VStack{
                TabView{
                    HerosView()
                        .tabItem {
                            Label(
                                title: { Text("Heroes") },
                                icon: { Image(systemName: "house") })
                    }
                    
                    Text("Hola")
                        .tabItem {
                            Label(
                                title: { Text("Heroes 3D") },
                                icon: { Image(systemName: "person.fill") })
                    }
                }
            }
            
            // ----------------------
            // Reality Kit. Sonido
            // ----------------------

        }
    }
}

#Preview {
    MainView()
}

