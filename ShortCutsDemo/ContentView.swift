import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink {
                        ContainerForAll()
                    } label: {
                        HStack {
                            Image(systemName: "rectangle.grid.2x2")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                            Text("All Shortcuts")
                        }
                    }
                }
            }
            .navigationTitle("Shortcuts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
