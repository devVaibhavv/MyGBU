//
//  TimetableViewModel.swift
//  MyGBU Student
//
//  Created by Vaibhav Singh on 18/06/25.
//


import Foundation

class TimetableViewModel: ObservableObject {
    @Published var timetable: [String: [TimetableSlot]] = [:]

    init() {
        loadSampleData()
    }

    func loadSampleData() {
        timetable = [
            "Monday": [
                TimetableSlot(day: "Monday", period: "9:00 - 10:00", subject: "Math", instructor: "Dr. Singh", location: "Room 101"),
                TimetableSlot(day: "Monday", period: "10:00 - 11:00", subject: "Physics", instructor: "Ms. Verma", location: "Room 202")
            ],
            "Tuesday": [
                TimetableSlot(day: "Tuesday", period: "9:00 - 10:00", subject: "Chemistry", instructor: "Mr. Das", location: "Lab 2"),
                TimetableSlot(day: "Tuesday", period: "11:00 - 12:00", subject: "Biology", instructor: "Ms. Sharma", location: "Room 305")
            ],
            // Add more days similarly...
        ]
    }

    // Placeholder for future API
    func fetchTimetableFromAPI() {
        // Fetch from server
    }
}
