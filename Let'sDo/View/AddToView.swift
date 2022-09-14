import SwiftUI

struct AddToView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFiledtext: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                textFieldArea
                saveButton
            }
            .padding(14)
        }
        .navigationTitle("Add an item ✏️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddToView()
        }
    }
}

extension AddToView {
    var textFieldArea: some View {
        TextField("Start typing here", text: $textFiledtext)
            .padding(.horizontal)
            .frame(height: 60)
            .background(.gray.opacity(0.1))
            .cornerRadius(10)
    }
    
    var saveButton: some View {
        Button(action: saveButtonPressed) {
            Text("save".uppercased())
                .font(.headline)
                .frame(height: 60)
                .frame(maxWidth:.infinity)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(10)
        }
    }
    
    func saveButtonPressed() {
        listViewModel.addItem(title: textFiledtext)
        presentationMode.wrappedValue.dismiss()
    }
}
