//
//  DashboardViewController.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var viewModel = DashboardViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {

                    // Profile Header with Material Background
                    HStack(spacing: 20) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [ Color.blue],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .background(.ultraThinMaterial, in: Circle())
                            .shadow(radius: 8)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Welcome back,")
                                .font(.subheadline).foregroundColor(.secondary)
                            Text(viewModel.user.name)
                                .font(.largeTitle.weight(.semibold))
                                .lineLimit(1)
                            Text("\(viewModel.user.course) - Semester \(viewModel.user.semester)")
                                .font(.footnote).foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)

                    // Recent Notices Card with Material and Shadow
                    Group {
                        SectionTitle("Recent Notices")
                        VStack(spacing: 12) {
                            ForEach(viewModel.notices, id: \.id) { notice in
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(notice.title).font(.headline)
                                        .foregroundColor(.accentColor)
                                    Text(notice.description)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    Divider()
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        .padding()
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(radius: 6)
                        .padding(.horizontal)
                    }

                    // Today's Timetable Card
                    Group {
                        SectionTitle("Today's Timetable")
                        
                        VStack(spacing: 14) {
                            ForEach(viewModel.todayTimetable, id: \.subject) { entry in
                                HStack {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(entry.subject)
                                            .font(.headline.weight(.medium))
                                        Text("\(entry.startTime) – \(entry.endTime) | \(entry.location)")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Attendance Card using Grid
//                    Group {
//                        SectionTitle("Attendance Stats")
//                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
//                            ForEach(viewModel.attendanceStats, id: \.id) { subject in
//                                VStack(spacing: 8) {
//                                    Text(subject.name)
//                                        .font(.headline)
//                                    ZStack {
//                                        Circle()
//                                            .stroke(Color.gray.opacity(0.3), lineWidth: 10)
//                                            .frame(width: 80, height: 80)
//                                        Circle()
//                                            .trim(from: 0, to: CGFloat(subject.attendance.percentage)/100)
//                                            .stroke(subject.attendance.percentage < 75 ? Color.red : Color.green, style: StrokeStyle(lineWidth: 10, lineCap: .round))
//                                            .rotationEffect(.degrees(-90))
//                                            .frame(width: 80, height: 80)
//                                            .animation(.easeInOut, value: subject.attendance.percentage)
//                                        Text(String(format: "%.0f%%", subject.attendance.percentage))
//                                            .font(.title3.bold())
//                                    }
//                                }
//                                .padding()
//                                .background(.ultraThinMaterial)
//                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
//                            }
//                        }
//                        .padding(.horizontal)
//                    }

                    // Quick Actions with modern buttons
//                    HStack(spacing: 30) {
//                        QuickActionButton(systemIcon: "book.fill", title: "Assignments") {}
//                        QuickActionButton(systemIcon: "paperplane.fill", title: "Submit") {}
//                        QuickActionButton(systemIcon: "bell.fill", title: "Notices") {}
//                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SectionTitle: View {
    var text: String
    init(_ text: String) { self.text = text }
    var body: some View {
        Text(text)
            .font(.title2.weight(.semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.bottom, 4)
            .foregroundColor(.primary)
    }
}

struct QuickActionButton: View {
    var systemIcon: String
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: systemIcon)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(
                        LinearGradient(
                            colors: [Color.purple, Color.blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color.blue.opacity(0.4), radius: 5, x: 0, y: 5)

                Text(title)
                    .font(.footnote.weight(.medium))
                    .foregroundColor(.primary)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}




#Preview {
    DashboardView()
}
