//
//  SettingsView.swift
//  Translator
//
//  Created by Liam Deman on 20/08/2022.
//

import SwiftUI
struct SettingsView: View {
    //@StateObject private var viewModel = TranslationViewModel();


    var body: some View {
        NavigationView{
            List{
                Text("Source language")
                Text("Destination language")
                Text("About")
            }
            .navigationTitle("Menu")
        }
    }
}


struct TranslationView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationView()
    }
}
