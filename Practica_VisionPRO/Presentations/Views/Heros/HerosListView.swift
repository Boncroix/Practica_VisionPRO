//
//  HerosListView.swift
//  Practica_VisionPRO
//
//  Created by Jose Bueno Cruz on 12/6/24.
//

import SwiftUI

struct HerosListView: View {
    
    // MARK: Properties
    @StateObject var viewModel: HerosViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    HerosListView(viewModel: HerosViewModel())
}
