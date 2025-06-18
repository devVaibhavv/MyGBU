//
//  TimetableSlot.swift
//  MyGBU Student
//
//  Created by Vaibhav Singh on 18/06/25.
//


import Foundation

struct TimetableSlot: Identifiable {
    let id = UUID()
    let day: String
    let period: String
    let subject: String
    let instructor: String
    let location: String
}
