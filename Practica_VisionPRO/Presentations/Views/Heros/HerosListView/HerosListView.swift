//
//  HerosListView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 15/6/24.
//

import SwiftUI
import MarvelAppLibrary

struct HerosListView: View {
    
    @State var viewModel = HerosViewModel()
    @Binding var selectedHero: Hero?
    
    var body: some View {
        List(selection: $selectedHero) {
            ForEach(viewModel.heros) { data in
                NavigationLink(value: data) {
                    HerosRowView(hero: data)
                }
                .tag(data)
            }
        }
        .navigationTitle("Heroes")
    }
}
