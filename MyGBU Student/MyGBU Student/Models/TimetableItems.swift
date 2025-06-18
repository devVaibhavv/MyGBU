import Foundation

struct TimetableItem: Identifiable, Codable, Hashable {
    let id = UUID()
    let day: String
    let subject: String
    let time: String
}
