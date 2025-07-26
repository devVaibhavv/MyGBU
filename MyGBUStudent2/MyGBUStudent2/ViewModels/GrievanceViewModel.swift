//
//  GrievanceViewModel.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//
import Foundation

struct Grievance: Identifiable {
    let id: String
    let title: String
    let status: String
    let date: Date
}

class GrievanceViewModel: ObservableObject {
    @Published var grievances: [Grievance] = []
    @Published var newGrievanceTitle: String = ""

    init() {
        // Hardcoded initial grievances
        grievances = [
            Grievance(id: "g1", title: "Hstel Cleanliness", status: "Pending", date: Date()),
            Grievance(id: "g2", title: "Mess food quality", status: "Resolved", date: Date().addingTimeInterval(-5*86400))
        ]
    }

    // API placeholders
    func fetchGrievancesFromAPI() { /* TODO */ }

    func submitGrievance() {
        guard !newGrievanceTitle.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let new = Grievance(id: UUID().uuidString, title: newGrievanceTitle, status: "Pending", date: Date())
        grievances.insert(new, at: 0)
        newGrievanceTitle = ""
        // TODO: send to server
    }
}


