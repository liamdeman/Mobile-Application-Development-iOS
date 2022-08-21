//
//  TranslatorApp.swift
//  Shared
//
//  Created by Liam Deman on 19/08/2022.
//

import SwiftUI

@main
struct TranslatorApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                TranslationView()
                    .tabItem{
                        Label("Translate", systemImage: "book")
                    }
                LanguageSelectionView(type: LanguageSelectionType.source)
                    .tabItem{
                        Label("Source language", systemImage: "gear")
                    }
                LanguageSelectionView(type: LanguageSelectionType.destination)
                    .tabItem{
                        Label("Destination language", systemImage: "gear")
                    }
            }
        }
    }
}

