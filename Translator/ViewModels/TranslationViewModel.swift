//
//  TranslationViewModel.swift
//  Translator
//
//  Created by Liam Deman on 20/08/2022.
//

import Foundation

extension TranslationView{
    @MainActor class TranslationViewModel: ObservableObject {
        @Published var originalText: String = "";
        @Published var translatedText: String = "Click 'Translate!' to start translation";
        
        func translate() {
            translatedText = originalText + "(translated)";
        }
    }
}
