
import Foundation
import SwiftUI

enum ActionType: CaseIterable {
    case none
    case menu
    case menuStart
    case menuEnd
    case endMenu
    case volume
    case get
    case turn

    var title: String {
        switch self {
        case .menu:
            return "Choose Menu"
        case .volume:
            return "Set Volume"
        case .get:
            return "Get From"
        case .turn:
            return "Turn Until"
        case .endMenu:
            return "End Menu"
        case .menuStart:
            return "menuStart"
        case .menuEnd:
            return "menuEnd"
        default:
            return ""
        }
    }
}

class Action: Identifiable, Equatable {
    private(set) var type: ActionType

    var left: CGFloat = 0

    init(type: ActionType) {
        self.type = type
    }

    static func == (lhs: Action, rhs: Action) -> Bool {
        return lhs.type == rhs.type
    }
}
