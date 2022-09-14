import SwiftUI

struct TextFieldView: View {
    @State var textFiledtext: String = ""
    var body: some View {
        TextField("Start typing here", text: $textFiledtext)
            .padding(.horizontal)
            .frame(height: 60)
            .background(.gray.opacity(0.1))
            .cornerRadius(10)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
