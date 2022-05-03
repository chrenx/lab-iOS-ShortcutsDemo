
import SwiftUI
import UniformTypeIdentifiers
import Foundation
import Dispatch

struct AddShortcutPage: View {
    @Binding var presentAddView: Bool
    @State private var presentActionList: Bool = false
    @State private var shortcutName: String = ""
    @State private var actionChosen = Action(type: .none)
    @State private var actionChosenArr: [Action] = []

    @State private var start: String = ""
    @State private var end: String = "Ending"

    @State var draggedItem: Action?

    var body: some View {
        VStack {
            FixedHeader(presentAddView: $presentAddView, shortcutName: $shortcutName)
                .onChange(of: actionChosen) { new in
                    if !actionChosenArr.contains(new) {
                        actionChosenArr.append(new)
                        if new.type == .menu {
                            let arr: [ActionType] = [.menuStart, .menuEnd, .endMenu]
                            actionChosenArr.append(contentsOf: arr.compactMap { Action(type: $0) })

                            /// 解决只出现数组前两个的问题，将start强制赋值一下
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                                start = "Starting"
                            }

                        }
                    }
                }
            LazyVStack(spacing: 20) {
                Spacer()
                ForEach(actionChosenArr, id: \.self.type) { option in
                    if option.type == .menu {
                        MenuView(start: $start, end: $end)
                    } else if option.type == .menuStart {
                        HStack {
                            Image("menu").resizable().frame(width: 25.0, height: 25.0)
                            Text(start)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
                        .background(Color.white)
                        .cornerRadius(10)
                        .onDrop(of: [UTType.text], delegate: MyDropDelegate(item: option, items: $actionChosenArr, draggedItem: $draggedItem))
                    } else if option.type == .menuEnd {
                        HStack {
                            Image("menu").resizable().frame(width: 25.0, height: 25.0)
                            Text(end)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
                        .background(Color.white)
                        .cornerRadius(10)
                        .onDrop(of: [UTType.text], delegate: MyDropDelegate(item: option, items: $actionChosenArr, draggedItem: $draggedItem))
                    } else if option.type == .endMenu {
                        HStack {
                            Image("menu").resizable().frame(width: 25.0, height: 25.0)
                            Text(option.type.title)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
                        .background(Color.white)
                        .cornerRadius(10)
                        .onDrop(of: [UTType.text], delegate: MyDropDelegate(item: option, items: $actionChosenArr, draggedItem: $draggedItem))
                    } else if option.type == .volume {
                        HStack {
                            VolumeView()
                        }
                        .padding(EdgeInsets(top: 0, leading: option.left, bottom: 0, trailing: 0))
                        .onDrag {
                            self.draggedItem = option
                            return NSItemProvider(item: nil, typeIdentifier: option.type.title)
                        }
                        .onDrop(of: [UTType.text], delegate: MyDropDelegate(item: option, items: $actionChosenArr, draggedItem: $draggedItem))
                    } else if option.type == .get {
                        HStack {
                            GetView()
                        }
                        .padding(EdgeInsets(top: 0, leading: option.left, bottom: 0, trailing: 0))
                        .onDrag {
                            self.draggedItem = option
                            return NSItemProvider(item: nil, typeIdentifier: option.type.title)
                        }
                        .onDrop(of: [UTType.text], delegate: MyDropDelegate(item: option, items: $actionChosenArr, draggedItem: $draggedItem))
                    } else if option.type == .turn {
                        HStack {
                            TurnView()
                        }
                        .padding(EdgeInsets(top: 0, leading: option.left, bottom: 0, trailing: 0))
                        .onDrag {
                            self.draggedItem = option
                            return NSItemProvider(item: nil, typeIdentifier: option.type.title)
                        }
                        .onDrop(of: [UTType.text], delegate: MyDropDelegate(item: option, items: $actionChosenArr, draggedItem: $draggedItem))
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))

            Spacer()
            AddActionBtn(presentActionList: $presentActionList, actionChosen: $actionChosen)
                .padding([.bottom], 10)
        }.background(Color(hex: 0xF2F2F6))
    }
}

struct MyDropDelegate: DropDelegate {
    let item: Action
    @Binding var items: [Action]
    @Binding var draggedItem: Action?

    func performDrop(info: DropInfo) -> Bool {
        return true
    }

    func dropEntered(info: DropInfo) {
        guard let draggedItem = self.draggedItem else {
            return
        }

        if draggedItem != item {
            let from = items.firstIndex(of: draggedItem)!
            let to = items.firstIndex(of: item)!
            withAnimation(.default) {
                self.items.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)

                var startPass = false
                var endPass = false
                var endMenuPass = false

                for index in 0 ..< to {
                    if items[index].type == .menuStart {
                        startPass = true
                    }
                    if items[index].type == .menuEnd {
                        endPass = true
                    }
                    if items[index].type == .endMenu {
                        endMenuPass = true
                    }
                }

                if startPass, endPass, endMenuPass {
                    draggedItem.left = 0
                } else {
                    draggedItem.left = 30
                }
            }
        }
    }
}
