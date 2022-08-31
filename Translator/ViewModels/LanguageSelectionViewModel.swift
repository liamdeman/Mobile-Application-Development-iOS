import Foundation
import CoreLocation


extension LanguageSelectionView{
    @MainActor class LanguageSelectionViewModel: ObservableObject {
        @Published var type: LanguageSelectionType!
        @Published var selectedLangugae: Language!{
            didSet{
                if let encoded = try? JSONEncoder().encode(selectedLangugae) {
                    UserDefaults.standard.set(encoded, forKey: type.rawValue)
                   }
                
            }
        }
        
        @Published var languages: [Language] = []
        let baseUrl = "https://libretranslate.com"
        
        init(type: LanguageSelectionType){
            self.type = type
            self.getLanguages()
            self.getSelectedLanguage()
        }
        
        
        func getLanguages() {
            if let path = Bundle.main.path(forResource: "Languages", ofType: "json") {
                do {
                      let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    self.languages = try JSONDecoder().decode([Language].self, from: data)
                  } catch {
                       //TODO: handle error
                  }
            }
        }
        
        
        func getSelectedLanguage(){
            if let data = UserDefaults.standard.data(forKey: type.rawValue) {
                    if let decoded = try? JSONDecoder().decode(Language.self, from: data) {
                        self.selectedLangugae = decoded
                    }
                }
        }
        
    }
}
