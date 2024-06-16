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
                        .id(1)
                        .tabItem {
                            Label(
                                title: { Text("Heroes") },
                                icon: { Image(systemName: "house") })
                    }
                    
                    SettingsView()
                        .id(2)
                        .tabItem {
                            Label(
                                title: { Text("Settings") },
                                icon: { Image(systemName: "gearshape") })
                    }
                }
                .id(0)
            }
            
            RealityView{ content in
                if let scene = try? await Entity(named: "Heros", in: realityKitContentBundle){

                    guard let SoundEmitter = scene.findEntity(named: "SoundEmitter") else {
                        NSLog("No encuenta el SoundEmitter")
                        return
                    }
                    
                    guard let recourceSound = try? await AudioFileResource(named: "/Root/soundMarvel_mp3", from: "Heros.usda", in: realityKitContentBundle) else {
                        NSLog("No encuenta el sonido")
                        return
                    }
                    
                    let audio = SoundEmitter.prepareAudio(recourceSound)
                    audio.play()
                    
                    content.add(scene)
                    
                }
            }
            .id(3)
        }
    }
}

#Preview {
    MainView()
}

