import SwiftUI

enum LanguageSelectionType: String{
    case source = "source"
    case destination = "destination"
}
struct LanguageSelectionView: View {
    @StateObject private var viewModel: LanguageSelectionViewModel


    init(type: LanguageSelectionType){
        _viewModel = StateObject(wrappedValue: LanguageSelectionViewModel(type: type))
    }
    
    
    var body: some View {
        NavigationView{
            List(viewModel.languages, id: \.self, selection: $viewModel.selectedLangugae) { item in
                Text(item.name)
                    
            }
            .toolbar{
                HStack{
                    EditButton()
                }
            }
        }
    }
}


struct LanguageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSelectionView(type: LanguageSelectionType.source)
    }
}
