import Foundation

class EventUtility {
    static var normalEvents: [Event] = []
    static var checkEvents: [Event] = []
    
    static func loadEventsFromCSV() {
        let allEvents = CSVLoader.loadEvents(from: "events")
        
        normalEvents = allEvents.filter { $0.EventType == .normal }
        checkEvents = allEvents.filter { $0.EventType == .check }
        
        print("Loaded \(normalEvents.count) normal events and \(checkEvents.count) check events")
    }
    
    static func createEventFromStation(_ station: Station) -> Event {
        switch station.EventType {
        case .normal:
            if !normalEvents.isEmpty {
                let randomIndex = Int.random(in: 0..<normalEvents.count)
                var selectedEvent = normalEvents[randomIndex]
                selectedEvent.currentUser = nil
                return selectedEvent
            }
        case .check:
            if !checkEvents.isEmpty {
                let randomIndex = Int.random(in: 0..<checkEvents.count)
                var selectedEvent = checkEvents[randomIndex]
                selectedEvent.currentUser = nil
                self.updateCheckActionConfig(for:&selectedEvent)
                return selectedEvent
            }
        case .special:
            // For special events, return a default event for now
            break
        }
        
        return Event(
            EventType: station.EventType,
            Title: "Event at \(station.Name)",
            Story: "You have arrived at \(station.Name) station. Something interesting might happen here.",
            currentUser: nil,
            actions: [ActionConfig()]
        )
    }

    private static func updateCheckActionConfig(for event: inout Event) {
        var action1 = ActionConfig(
            StoryResult: "",
            HPChange: 0,
            MoneyChange: 0,
            SanityChange: 0,
            SkipRound: false,
            RepeatRound: false
        )
        
        var action2 = ActionConfig(
            StoryResult: "",
            HPChange: 0,
            MoneyChange: 0,
            SanityChange: 0,
            SkipRound: false,
            RepeatRound: false
        )
        if event.Title == "孩童" {
            action1.StoryResult = "在她的眼神祈求下，你买了一块巧克力。巧克力真香！你心满意足。"
            action1.HPChange = 2
            action1.MoneyChange = -2
            action2.StoryResult = "你向她摆了摆手，表示不要，下车的时候一摸口袋，哎怎么少了点东西！？"
            action2.MoneyChange = -2
        } else if event.Title == "巡演" {
            action1.StoryResult = "你扫了他们的二维码，打了一杯咖啡的钱。咖啡好喝，生活也不能没有梦想！"
            action1.SanityChange = 2
            action1.MoneyChange = -2
            action2.StoryResult = "你低着头假装什么也没有听见，下车的时候一摸口袋，哎怎么少了点东西！？"
            action2.MoneyChange = -2
        } else if event.Title == "飞跃" {
            action1.StoryResult = "没有人看见你的违法行为，从今天起，你成为了一个真正的New Yorker！"
            action1.HPChange = -2
            action1.MoneyChange = 2
            action2.StoryResult = "警亭里突然冒出来一个黑人大姐，揪住了你，看在你是初犯的份上，补买地铁票，下不为例！"
            action2.MoneyChange = -2
        } else if event.Title == "空车厢" {
            action1.StoryResult = "你当机立断，决定换一节车厢。"
            action1.SanityChange = +2
            action1.HPChange = -2
            action2.StoryResult = "在你犹豫要不要换车厢时，车启动了……接下来到站前，你将一直在害怕流浪汉随时醒来并突然发疯的恐惧之中。"
            action2.SanityChange = -2
        }
        event.actions = [action1, action2]
    }
}
