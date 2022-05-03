
import SwiftUI

struct ContainerForAll: View {
    @State private var presentAddView: Bool = false

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Create shortcuts for things you do every day")
                    .foregroundColor(.gray)
                Spacer()
            }
            .navigationBarItems(trailing: Button(action: {
                withAnimation(.easeInOut(duration: 0.6)) {
                    self.presentAddView = true
                }
            }) {
                Image(systemName: "plus")
            }
            .fullScreenCover(isPresented: $presentAddView) {
                AddShortcutPage(presentAddView: $presentAddView)
            })
            .navigationTitle("All Shortcuts")
            .navigationBarHidden(presentAddView)
        }
    }
}
