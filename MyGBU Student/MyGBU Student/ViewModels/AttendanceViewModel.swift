import Foundation

class AttendanceViewModel: ObservableObject {
    @Published var records: [AttendanceRecord] = []

    init() {
        loadSampleData()
    }

    func loadSampleData() {
        records = [
            AttendanceRecord(subject: "Math", attended: 20, total: 25),
            AttendanceRecord(subject: "Physics", attended: 18, total: 22),
            AttendanceRecord(subject: "Chemistry", attended: 22, total: 25),
            AttendanceRecord(subject: "Biology", attended: 19, total: 24),
            AttendanceRecord(subject: "English", attended: 25, total: 25)
        ]
    }

    // Placeholder for API
    func fetchAttendanceFromAPI() {
        // API logic here
    }
}
