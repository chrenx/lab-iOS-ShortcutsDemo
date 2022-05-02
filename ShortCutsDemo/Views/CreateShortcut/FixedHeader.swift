//
//  FixedHeader.swift
//  recreate-shortcut
//
//  Created by chrenx on 4/23/22.
//

import SwiftUI

struct FixedHeader: View {
    @Binding var presentAddView: Bool
    @Binding var shortcutName: String

    var body: some View {
        HStack {
            Image(systemName: "square.2.stack.3d")
                .padding([.leading], 20)
            Spacer()
            TextField("Shortcut Name", text: $shortcutName)
            Spacer()
            Button(action: {
                withAnimation(.easeInOut(duration: 0.6)) {
                    self.presentAddView = false
                }
            }) {
                Text("Done")
            }
            .padding([.trailing], 20)
        }
        .padding([.bottom], 15)
        .overlay(
            Rectangle()
                .frame(width: nil, height: 1, alignment: .bottom)
                .foregroundColor(Color.gray), alignment: .bottom).padding([.bottom], -8)
        .padding([.top], 20)
    }
}
