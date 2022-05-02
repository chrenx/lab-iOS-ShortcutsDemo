//
//  ActionList.swift
//  recreate-shortcut
//
//  Created by chrenx on 4/22/22.
//

import SwiftUI

struct ActionList: View {
    @Binding var actionChosen: Action
    @Binding var presentActionList: Bool

    var options: [Action] = [ActionType.menu, ActionType.volume, ActionType.get, ActionType.turn].compactMap{ Action(type: $0) }

    var body: some View {
        ZStack {
            Color(hex: 0xF6F6F6).edgesIgnoringSafeArea(.all)
            VStack {
                Capsule()
                    .fill(Color.secondary)
                    .frame(width: 30, height: 3)
                    .padding(10)

                VStack {
                    ForEach(options) { option in
                        HStack {
                            HStack {
                                ActionsBtn(presentActionList: $presentActionList, option: option, getOption: $actionChosen)
                            }
                        }
                        .padding([.top, .bottom], 2)
                        .padding([.trailing, .leading], 5)
                    }
                }
                Spacer()
            }
        }
    }
}
