import Foundation

class ListViewModel: ObservableObject {

    let itemKey: String = "itemsList"
    @Published var items: [ItemModel] = [] {
        didSet {
            savItem()
        }
    }

    init() {
        getItems()
    }

    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.items = savedItem
    }

    func deletItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }

    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }

    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }

    func savItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
