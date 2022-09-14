import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [
        ItemModel(title: "First", isCompleted: false),
        ItemModel(title: "Second", isCompleted: false),
        ItemModel(title: "Third", isCompleted: true)
    ]
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("To Do List 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

