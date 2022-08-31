import Foundation

extension TranslationView{
    @MainActor class TranslationViewModel: ObservableObject {
        @Published var originalText: String = "";
        @Published var translatedText: String = "Click 'Translate!' to start translation";
        private let apiUrl = "https://libretranslate.de/"

        func translate() {
            if (originalText.isEmpty){
                translatedText = "No text entered"
            }
            else {
                fetchTranslation()
            }
        }
        
        func fetchTranslation() -> Void {
            var httpRequest = URLRequest(url: URL(string: "\(apiUrl)translate")!)
            httpRequest.httpMethod = "POST"
            
            let body: [String: String] =
            [
            "q": originalText,
            "source": self.getLanguage(type: LanguageSelectionType.source),
            "target": self.getLanguage(type: LanguageSelectionType.destination)
            ]
            httpRequest.httpBody = self.stringifyDictonary(dict: body).data(using: .utf8)
            
            URLSession.shared.dataTask(with: httpRequest) { data, response,error in
                if (error == nil && data != nil){
                    let responseData = try! JSONDecoder().decode(Translation.self, from: data!)
                    self.translatedText = responseData.translatedText
                }
                else{
                    self.translatedText = "Server Error"
                }
                
            }.resume()
        }
        
        
        //method copied from stackoverflow.com
        func stringifyDictonary(dict:[String:String]) -> String
            {
                var entries = [String]()
                for(key, value) in dict
                {
                    entries.append(key + "=\(value)")
                }
                return entries.map { String($0) }.joined(separator: "&")
            }
        
        func getLanguage(type: LanguageSelectionType) -> String
        {
            if let data = UserDefaults.standard.data(forKey: type.rawValue) {
                    if let decoded = try? JSONDecoder().decode(Language.self, from: data) {
                        return decoded.code
                    }
                }
            return type == LanguageSelectionType.source ? "en" : "es"
        }

    }
}
