//
//  Subject.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//
import SwiftUI
import Foundation

struct Subject: Identifiable  {
    let id: String
    let name: String
    let attendance: AttendanceRecord
    let assignments: [Assignment]
}
