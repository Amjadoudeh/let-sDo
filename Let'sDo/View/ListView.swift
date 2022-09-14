import SwiftUI

struct ListView: View {
    @State var items: [String] = [
    "first", "Second", "Third"
    ]
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("To Do List 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: Text("to add")))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

