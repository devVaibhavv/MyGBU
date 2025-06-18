//
//  ResultsViewModel.swift
//  MyGBU Student
//
//  Created by Vaibhav Singh on 18/06/25.
//


import Foundation

class ResultsViewModel: ObservableObject {
    @Published var results: [ExamResult] = []

    init() {
        loadSampleResults()
    }

    func loadSampleResults() {
        results = [
            ExamResult(subject: "Math", marksObtained: 88, totalMarks: 100),
            ExamResult(subject: "Physics", marksObtained: 75, totalMarks: 100),
            ExamResult(subject: "Chemistry", marksObtained: 62, totalMarks: 100),
            ExamResult(subject: "Biology", marksObtained: 48, totalMarks: 100),
            ExamResult(subject: "English", marksObtained: 93, totalMarks: 100)
        ]
    }

    // Placeholder for future API call
    func fetchResultsFromAPI() {
        // API logic here
    }
}
