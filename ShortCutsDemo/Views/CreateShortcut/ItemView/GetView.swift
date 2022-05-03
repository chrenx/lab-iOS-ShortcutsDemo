
import SwiftUI

struct GetView: View {
    @State
    private var eventValue: String = ""
    @State
    private var fromValue: String = ""

    var body: some View {
        HStack {
            Image("calendar").resizable().frame(width: 32.0, height: 32.0)
            Text("Get")
            TextField("1 event", text: $eventValue)
            Text("from")
            TextField("All Calendars", text: $fromValue)
            Spacer()
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
        .background(Color.white)
        .cornerRadius(10)
    }
}
