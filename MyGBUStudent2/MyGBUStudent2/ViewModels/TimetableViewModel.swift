//
//  TimetableViewModel.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//
import Foundation

class TimetableViewModel: ObservableObject {
    @Published var weeklyTimetable: [String: [Timetable]] = [:]
    @Published var daysOfWeek: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

    init() {
        // MARK: Hardcoded Timetable for Demonstration
        weeklyTimetable = [
            "Monday": [
                Timetable(day: "Monday", subject: "Maths", startTime: "10:30", endTime: "11:30", location: "IL101"),
                Timetable(day: "Monday", subject: "Physics", startTime: "11:30", endTime: "12:30", location: "IL102"),
                Timetable(day: "Monday", subject: "C-programming", startTime: "1:30", endTime: "2:30", location: "IL102"),
            ],
            "Tuesday": [
                Timetable(day: "Tuesday", subject: "C-Programming", startTime: "10:00", endTime: "11:00", location: "IL103"),
                Timetable(day: "Tuesday", subject: "Physics", startTime: "11:30", endTime: "12:30", location: "IL102"),
                Timetable(day: "Tuesday", subject: "Electronics Lab", startTime: "01:30", endTime: "02:30", location: "IP102"),
            ]
            // Add other days similarly
        ]
    }

    // MARK: - API Integration placeholder
    func fetchTimetableFromAPI() {
        // TODO: Implement API call to fetch timetable and assign to weeklyTimetable
    }
}
