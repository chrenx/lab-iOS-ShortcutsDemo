//
//  TurnView.swift
//  ShortCutsDemo
//
//  Created by CoderStar on 2022/5/1.
//

import SwiftUI

struct TurnView: View {
    @State
    private var value1: String = ""
    @State
    private var value2: String = ""
    @State
    private var value3: String = ""

    var body: some View {
        HStack {
            Image("moon").resizable().frame(width: 25.0, height: 25.0)
            Text("Turn")
            TextField("Do Not Disturb", text: $value1)
            TextField("On", text: $value2)
            Text("until")
            TextField("Turned Off", text: $value3)
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
        .background(Color.white)
        .cornerRadius(10)
    }
}
