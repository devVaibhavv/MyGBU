//
//  TimetableViewController.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//
import SwiftUI


struct TimetableView: View {
    @StateObject var viewModel = TimetableViewModel()
    @State private var selectedDay: String = "Monday"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                // Segmented day picker with blur
                Picker("", selection: $selectedDay) {
                    ForEach(viewModel.daysOfWeek, id: \.self) { day in
                        Text(day).tag(day)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                .shadow(radius: 2, y: 1)

                ScrollView {
                    VStack(spacing: 16) {
                        if let entries = viewModel.weeklyTimetable[selectedDay], !entries.isEmpty {
                            ForEach(entries, id: \.subject) { entry in
                                HStack(spacing: 18) {
                                    Image(systemName: "book.closed.fill")
                                        .font(.title)
                                        .foregroundColor(.blue)
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(entry.subject)
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        Text("\(entry.startTime) – \(entry.endTime)")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                        Text(entry.location)
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(.thinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .shadow(color: .blue.opacity(0.06), radius: 3, x: 0, y: 2)
                            }
                        } else {
                            Text("No lectures scheduled today").foregroundColor(.secondary)
                                .padding()
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Timetable")
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}


#Preview {
    TimetableView()
}
