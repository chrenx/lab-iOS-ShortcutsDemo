//
//  AddActionBtn.swift
//  recreate-shortcut
//
//  Created by chrenx on 4/22/22.
//

import SwiftUI

struct AddActionBtn: View {
    @Binding var presentActionList: Bool
    @Binding var actionChosen: Action

    var body: some View {
        Button(action: {
            self.presentActionList = true
        }) {
            HStack {
                Spacer()
                Image(systemName: "plus.circle.fill")
                Text("Add Action").bold()
                Spacer()
            }
            .padding(15)
        }
        .background(Color(hex: 0xe1e7f7).cornerRadius(10))
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .sheet(isPresented: $presentActionList) {
            ActionList(actionChosen: $actionChosen, presentActionList: $presentActionList)
        }
    }
}
