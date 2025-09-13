import Foundation

struct CSVLoader {
    static func loadStations(from csvFileName: String) -> [Station] {
        guard let filePath = Bundle.main.path(forResource: csvFileName, ofType: "csv"),
              let content = try? String(contentsOfFile: filePath) else {
            print("Failed to load CSV file.")
            return []
        }
        
        let rows = content.components(separatedBy: "\n").dropFirst()
        return rows.compactMap { row in
            let columns = row.split(separator: ",").map { String($0) }
            guard columns.count >= 3 else {
                return Station(Name: "name", Code: "code", EventType: .normal)
            }

            let eventType: EventType
            let rawEventType = columns[2]
            if rawEventType.contains("Normal") {
                eventType = .normal
            } else if rawEventType.contains("Check") {
                eventType = .check
            } else if rawEventType.contains("Special") {
                eventType = .special
            } else {
                eventType = .normal
            }
            
            return Station(Name: columns[0], Code: columns[1], EventType: eventType, Lines: columns.count > 3 ? columns[3] : nil)
        }
    }
    
    static func loadEvents(from csvFileName: String) -> [Event] {
        guard let filePath = Bundle.main.path(forResource: csvFileName, ofType: "csv"),
              let content = try? String(contentsOfFile: filePath) else {
            print("Failed to load events CSV file.")
            return []
        }
        
        let rows = content.components(separatedBy: "\n").dropFirst()
        return rows.compactMap { row in
            let columns = row.components(separatedBy: ",").map { String($0) }
            guard columns.count >= 3 else {
                return nil
            }
            
            let eventType: EventType
            let rawEventType = columns[0]
            if rawEventType == "Normal" {
                eventType = .normal
            } else if rawEventType == "Check" {
                eventType = .check
            } else if rawEventType == "Special" {
                eventType = .special
            } else {
                eventType = .normal
            }
            
            var actionConfig = ActionConfig()
            if columns.count > 3 && columns[3]:! .isEmpty {
                actionConfig.StoryResult = columns[3]
            }
            if columns.count > 4 && !columns[4].isEmpty {
                actionConfig.HPChange = Int(columns[4]) ?? 0
            }
            if columns.count > 5 && !columns[5].isEmpty {
                actionConfig.MoneyChange = Int(columns[5]) ?? 0
            }
            if columns.count > 6 && !columns[6].isEmpty {
                actionConfig.SanityChange = Int(columns[6]) ?? 0
            }
            if columns.count > 7 && !columns[7].isEmpty {
                actionConfig.SkipRound = columns[7].lowercased() == "true"
            }
            if columns.count > 8 && !columns[8].isEmpty {
                actionConfig.RepeatRound = columns[8].lowercased() == "true"
            }
            
            return Event(
                EventType: eventType,
                Title: columns[1],
                Story: columns[2],
                currentUser: nil,
                actions: [actionConfig]
            )
        }
    }
}
