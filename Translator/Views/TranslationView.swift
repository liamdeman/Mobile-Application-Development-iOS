//
//  ContentView.swift
//  Shared
//
//  Created by Liam Deman on 19/08/2022.
//

import SwiftUI
struct TranslationView: View {
    @StateObject private var viewModel = TranslationViewModel();

    
    
    var body: some View {
        VStack{
            TextField("Aa", text: $viewModel.originalText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {viewModel.translate()}, label: {
                Text("Translate!")
            })
            Text(viewModel.translatedText)
        }
    }
}


struct TranslationView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationView()
    }
}
