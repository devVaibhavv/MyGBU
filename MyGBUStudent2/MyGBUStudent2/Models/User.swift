//
//  User.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//
import SwiftUI
import Foundation

struct User {
    let id: String
    let name: String
    let profilePicURL: String
    let semester: Int
    let course: String
    let performance: [SemesterPerformance]
}

struct SemesterPerformance {
    let semester: Int
    let gpa: Double
}
