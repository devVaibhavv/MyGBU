//
//  SubjectsViewModel.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
import Foundation

class SubjectsViewModel: ObservableObject {
    @Published var subjects: [Subject] = []

    init() {
        // MARK: Hardcoded Data Example
        subjects = [
            Subject(
                id: "s1",
                name: "Maths",
                attendance: AttendanceRecord(total: 24, attended: 20),
                assignments: [
                    Assignment(id: "a1", title: "Assignment 1", description: "Solve set A", dueDate: Date(), isSubmitted: false, facultyNotes: nil)
                ]
            ),
            Subject(
                id: "s2",
                name: "Physics",
                attendance: AttendanceRecord(total: 24, attended: 19),
                assignments: [
                    Assignment(id: "a2", title: "Lab Report", description: "Write up Experiment 3", dueDate: Date(), isSubmitted: true, facultyNotes: "Good work!")
                ]
            )
        ]
    }

    // MARK: API Placeholders
    func fetchSubjectsFromAPI() {
        // TODO: Replace hardcoded subjects with API response
    }

    func submitAssignment(subjectID: String, assignmentID: String) {
        // TODO: API call to submit assignment
    }
}


