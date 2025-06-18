//
//  ExamResult.swift
//  MyGBU Student
//
//  Created by Vaibhav Singh on 18/06/25.
//


import Foundation
import SwiftUICore

struct ExamResult: Identifiable {
    let id = UUID()
    let subject: String
    let marksObtained: Int
    let totalMarks: Int

    var percentage: Double {
        guard totalMarks > 0 else { return 0 }
        return (Double(marksObtained) / Double(totalMarks)) * 100
    }

    var grade: String {
        switch percentage {
        case 90...: return "A+"
        case 80..<90: return "A"
        case 70..<80: return "B+"
        case 60..<70: return "B"
        case 50..<60: return "C"
        default: return "F"
        }
    }

    var gradeColor: Color {
        switch grade {
        case "A+", "A": return .green
        case "B+", "B": return .blue
        case "C": return .orange
        default: return .red
        }
    }
}
