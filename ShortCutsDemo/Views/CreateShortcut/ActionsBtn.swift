
import SwiftUI

struct ActionsBtn: View {
    @Binding
    var presentActionList: Bool

    var option: Action

    @Binding
    var getOption: Action

    var body: some View {
        Button(action: {
            self.presentActionList = false
            getOption = option
        }) {
            HStack {
                Text(option.type.title).foregroundColor(Color.black).bold()
                Spacer()
            }
        }
        .padding()
        .background(Color.white)
        .contentShape(Rectangle())
        .cornerRadius(10.0)
    }
}
