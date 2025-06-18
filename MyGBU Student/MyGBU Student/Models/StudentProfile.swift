
import Foundation

struct StudentProfile: Codable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let studentID: String
    let branch: String
    let semester: Int
    let email: String
}
