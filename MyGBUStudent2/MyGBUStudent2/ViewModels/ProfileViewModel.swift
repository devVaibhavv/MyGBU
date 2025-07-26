//
//  ProfileViewModel.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//
import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User

    init() {
        // MARK: Hardcoded user data
        user = User(
            id: "1",
            name: "Vaibhav Singh",
            profilePicURL: "profile_dummy",
            semester: 3,
            course: "B.Tech CSE",
            performance: [
                SemesterPerformance(semester: 1, gpa: 8.2),
                SemesterPerformance(semester: 2, gpa: 8.9),
            ]
        )
    }

    // MARK: Future API
    func fetchProfileFromAPI() {
        // TODO: Fetch profile data from server
    }
}
