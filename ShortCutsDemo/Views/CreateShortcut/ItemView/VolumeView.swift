
import SwiftUI

struct VolumeView: View {

    @State
    private var volumeValue: String = ""

    var body: some View {
        HStack {
            Image("volume").resizable().frame(width: 32.0, height: 32.0)
            Text("Set Volume to")
            TextField("0%", text: $volumeValue)
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
        .background(Color.white)
        .cornerRadius(10)
    }
}


