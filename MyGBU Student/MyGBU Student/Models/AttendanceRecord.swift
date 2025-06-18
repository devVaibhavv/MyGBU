import Foundation

struct AttendanceRecord: Identifiable {
    let id = UUID()
    let subject: String
    let attended: Int
    let total: Int

    var percentage: Double {
        guard total > 0 else { return 0 }
        return (Double(attended) / Double(total)) * 100
    }
}
