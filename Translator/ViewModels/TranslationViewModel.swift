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
