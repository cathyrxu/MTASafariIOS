import Foundation

struct Station: Identifiable {
    var id: UUID = UUID()
    var Name: String
    var Code: String
    var EventType :EventType
    var Lines: String?
}
