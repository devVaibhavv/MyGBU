//
//  AttendanceRecord.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//
import SwiftUI
import Foundation

struct AttendanceRecord {
    let total: Int
    let attended: Int

    var percentage: Double {
        total == 0 ? 0 : (Double(attended) / Double(total)) * 100
    }
}
