import Foundation

struct CSVLoader {
    static func loadStations(from csvFileName: String) -> [Station] {
        guard let filePath = Bundle.main.path(forResource: csvFileName, ofType: "csv"),
              let content = try? String(contentsOfFile: filePath) else {
            print("Failed to load CSV file.")
            return []
        }
        print(content)
        let rows = fileContent.components(separatedBy: "\n").dropFirst()
        return rows.compactMap { row in
            let columns = row.split(separator: ",").map { String($0) }
            guard columns.count >= 3 else { return nil }

            let eventType: EventType
            switch columns[2].lowercased() {
            case "Normal": eventType = .normal
            case "Check": eventType = .check
            case "Special": eventType = .special
            default: eventType = .normal
            }

            return Station(Name: columns[0], Code: columns[1], EventType: .eventType, Lines: columns.count > 3 ? columns[3] : nil)
        }
    }
}
