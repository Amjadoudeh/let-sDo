import SwiftUI

struct SaveButtonView: View {
    var body: some View {
        Button {
            // add action
        } label: {
            Text("save".uppercased())
                .font(.headline)
                .frame(height: 60)
                .frame(maxWidth:.infinity)
                .foregroundColor(.white)
                .background(Color.accentColor)
                .cornerRadius(10)
        }
    }
}



struct SaveButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SaveButtonView()
    }
}
