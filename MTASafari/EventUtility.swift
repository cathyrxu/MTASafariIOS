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
            StoryResult: "You have arrived at \(station.Name) station. Something interesting might happen here.",
            currentUser: nil,
            actions: [ActionConfig()]
        )
    }

    private static func updateCheckActionConfig(for event: inout Event) {
        var action1 = ActionConfig(
            HPChange: 0,
            MoneyChange: 0,
            SanityChange: 0,
            SkipRound: false,
            RepeatRound: false
        )
        
        var action2 = ActionConfig(
            HPChange: 0,
            MoneyChange: 0,
            SanityChange: 0,
            SkipRound: false,
            RepeatRound: false
        )
        if event.Title == "孩童" {
            action1.HPChange = 2
            action1.MoneyChange = -2
            action2.MoneyChange = -2
        } else if event.Title == "巡演" {
            action1.SanityChange = 2
            action1.MoneyChange = -2
            action2.MoneyChange = -2
        } else if event.Title == "飞跃" {
            action1.HPChange = -2
            action1.MoneyChange = 2
            action2.MoneyChange = -2
        } else if event.Title == "空车厢" {
            action1.SanityChange = +2
            action1.HPChange = -2
            action2.SanityChange = -2
        }
        event.actions = [action1, action2]
    }
}
