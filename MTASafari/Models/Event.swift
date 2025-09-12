import Foundation

enum EventType {
    case normal
    case check
    case special
}

struct ActionConfig {
    var HPChange: Int = 0
    var MoneyChange: Int = 0
    var SanityChange: Int = 0
    var SkipRound: Bool = false
    var RepeatRound: Bool = false

    func apply(to user: inout User) {
        user.HP += HPChange
        user.Money += MoneyChange
        user.Sanity += SanityChange
        if SkipRound {
            user.Moves += 1
        }
    }
}

struct Event {
    var Type: EventType
    var Title: String
    var Story: String
    var currentUser: User?
    var action: ActionConfig?

    func performAction(for user: inout User) -> String {
        guard let action = action else {
            return "No action available."
        }
        action.apply(to: &user)
        return "Action performed: HP \(action.HPChange), Money \(action.MoneyChange), Sanity \(action.SanityChange)"
    }
}
