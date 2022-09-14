import SwiftUI

struct AddView: View {
    var body: some View {
        ScrollView {
            VStack {
                TextFieldView()
                SaveButtonView()
            }
            .padding(14)
            
        }
        .navigationTitle("Add an item ✏️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
       
    }
}
