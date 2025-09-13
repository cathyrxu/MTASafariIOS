import Foundation

enum EventType {
    case normal
    case check
    case special
}

struct ActionConfig {
    var StoryResult: String
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
    var EventType: EventType
    var Title: String
    var Story: String
    var currentUser: User?
    var actions: [ActionConfig]
}
