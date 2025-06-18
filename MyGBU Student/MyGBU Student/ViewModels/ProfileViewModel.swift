

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profile: StudentProfile?

    init() {
        fetchProfile()
    }

    func fetchProfile() {
        // Simulate API call or local JSON parsing
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.profile = StudentProfile(
                name: "Vaibhav Singh",
                studentID: "S123456",
                branch: "Computer Science",
                semester: 6,
                email: "vaibhav@example.com"
            )
        }
    }
}
