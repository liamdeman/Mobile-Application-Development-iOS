import SwiftUI
struct TranslationView: View {
    @StateObject private var viewModel = TranslationViewModel();
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        VStack{
            TextEditor(text: $viewModel.originalText)
                .padding()
                .frame(maxHeight: .infinity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
                .overlay(
                     RoundedRectangle(cornerRadius: 25)
                        .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 5)
                     )
            Button(action: {viewModel.translate()}, label: {
                Text("Translate!")
                    .padding(10)
                    .font(Font.system(size: 80, weight: .bold))
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .background(RoundedRectangle(cornerRadius: 30))

            })
            TextEditor(text: .constant(viewModel.translatedText))
                .frame(maxHeight: .infinity)
                .overlay(
                     RoundedRectangle(cornerRadius: 25)
                       .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 5)
                     )
        }
        .frame(maxHeight: .infinity)
    }
}


struct TranslationView_Previews: PreviewProvider {
    static var previews: some View {
        TranslationView()
            .preferredColorScheme(.dark)
        TranslationView()
            .preferredColorScheme(.light)
    }
}
