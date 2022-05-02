//
//  MenuView.swift
//  ShortCutsDemo
//
//  Created by CoderStar on 2022/5/1.
//

import SwiftUI

struct MenuView: View {
    @State private var title: String = ""

    @Binding var start: String
    @Binding var end: String

    @State private var add: String = ""

    var body: some View {

        List {
            HStack {
                Image("menu").resizable().frame(width: 25.0, height: 25.0)
                Text("Choose from menu with")
                TextField("Is your event starting or ending?", text: $title)
                Spacer()
            }.listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)).padding([.leading], 20)
            ForEach(0 ..< 3) { itemIndex in
                if itemIndex == 0 {
                    HStack {
                        TextField(start, text: $start)
                        Spacer()
                    }
                } else if itemIndex == 1 {
                    HStack {
                        TextField(end, text: $end)
                        Spacer()
                    }
                } else if itemIndex == 2 {
                    HStack {
                        TextField("Add new item", text: $add)
                        Spacer()
                    }
                }
            }.onMove { _, _ in

            }.onDelete { _ in

            }.padding([.leading], 20)
        }
        .listStyle(PlainListStyle())
        .environment(\.editMode, .constant(EditMode.active))
        .frame(width: UIScreen.main.bounds.width - 50, height: 180)
        .cornerRadius(10)

    }
}
