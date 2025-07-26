//
//  DashboardViewModel.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//
import Foundation

class DashboardViewModel: ObservableObject {
    @Published var user: User
    @Published var notices: [Notice]
    @Published var todayTimetable: [Timetable]
    @Published var attendanceStats: [Subject]

    init(dummy: Bool = true) {
        // MARK: Hardcoded sample data for now
        user = User(
            id: "1",
            name: "Vaibhav Singh",
            profilePicURL: "profile_dummy",
            semester: 3,
            course: "B.Tech CSE",
            performance: [
                SemesterPerformance(semester: 1, gpa: 8.2),
                SemesterPerformance(semester: 2, gpa: 8.6)
            ]
        )

        notices = [
            Notice(id: "n1", title: "Exam Schedule", description: "Midterm on 15th Sep", date: Date()),
            Notice(id: "n2", title: "Holiday", description: "Campus closed on 2 Oct.", date: Date()),
            Notice(id: "n3", title: "Tech Fest", description: "3-day Tech fest from 7th to 9th Sep", date: Date())
        ]

        todayTimetable = [
            Timetable(day: "Monday", subject: "Maths", startTime: "10:00", endTime: "11:00", location: "Room 101"),
            Timetable(day: "Monday", subject: "Physics", startTime: "11:15", endTime: "12:15", location: "Room 102")
        ]

        attendanceStats = [
            Subject(
                id: "s1",
                name: "Maths",
                attendance: AttendanceRecord(total: 20, attended: 18),
                assignments: []
            ),
            Subject(
                id: "s2",
                name: "Physics",
                attendance: AttendanceRecord(total: 20, attended: 16),
                assignments: []
            ),
            Subject(
                id: "s3",
                name: "C-proggramming",
                attendance: AttendanceRecord(total: 20, attended: 10),
                assignments: []
            ),
            Subject(
                id: "s4",
                name: "Basic Electronics",
                attendance: AttendanceRecord(total: 20, attended: 8),
                assignments: []
            )
        ]
    }

    // MARK: - Placeholder for future API integration
    func fetchDashboardDataFromAPI() {
        // TODO: Call network layer here and assign to published properties
    }
}
