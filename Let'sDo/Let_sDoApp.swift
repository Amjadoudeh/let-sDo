import SwiftUI

@main
struct Let_sDoApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                if listViewModel.items.isEmpty {
                    withAnimation(.easeInOut) {
                        NoItemsView()
                    }
                } else {
                    ListView()
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
