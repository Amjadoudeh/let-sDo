import SwiftUI

struct AddToView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFiledtext: String = ""
    @State var alertTitle = ""
    @State var showAlert = false

    var body: some View {
        ScrollView {
            VStack {
                textFieldArea
                saveButton
            }
            .padding(14)
        }
        .navigationTitle("Add an item ✏️")
        .alert(isPresented: $showAlert, content: getAlert)
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
                .frame(maxWidth: .infinity)
                .foregroundColor(Color(uiColor: .secondarySystemBackground))
                .background(Color.accentColor)
                .cornerRadius(10)
        }
    }

    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFiledtext)
            presentationMode.wrappedValue.dismiss()
        }
    }

    func textIsAppropriate() -> Bool {
        if textFiledtext.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!  😱 🔐"
            showAlert.toggle()
            return false
        }
        return true
    }

    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}
