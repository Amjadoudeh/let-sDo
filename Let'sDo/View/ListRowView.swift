import SwiftUI

struct ListRowView: View {
    let item: ItemModel

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            if item.isCompleted {
                withAnimation {
                    Text(item.title )
                        .strikethrough()
                        .foregroundColor(.secondary)
                }
            } else {
                Text(item.title )
            }
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item: ItemModel(title: "Nice", isCompleted: false))
    }
}
