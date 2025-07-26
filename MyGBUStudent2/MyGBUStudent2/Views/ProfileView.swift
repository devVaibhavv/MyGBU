//
//  ProfileViewController.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//
import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    // User header with blur
                    HStack(spacing: 20) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .background(.regularMaterial, in: Circle())
                            .shadow(radius: 7)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(viewModel.user.name)
                                .font(.largeTitle.weight(.bold))
                            Text(viewModel.user.course)
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Text("Semester \(viewModel.user.semester)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            // Additional demo user data
                            Text("Email: vaibahv@gbu.ac.in")
                                .font(.callout)
                            Text("Roll No: 245UCS229")
                                .font(.callout)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .padding([.top, .horizontal])

                    Divider().padding(.horizontal)


                    // Semester Performance Chart (bar)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Previous Semesters")
                            .font(.title3.weight(.semibold))
                            .padding(.horizontal)
                        ForEach(viewModel.user.performance, id: \.semester) { perf in
                            HStack {
                                Text("Sem \(perf.semester)").frame(width: 68, alignment: .leading)
                                GeometryReader { geo in
                                    ZStack(alignment: .leading) {
                                        Capsule().fill(Color.gray.opacity(0.2)).frame(height: 14)
                                        Capsule().fill(Color.blue).frame(width: geo.size.width * CGFloat(perf.gpa / 10.0), height: 14)
                                    }
                                }.frame(height: 14)
                                Text(String(format: "%.2f", perf.gpa))
                                    .frame(width: 40, alignment: .trailing)
                            }
                            .frame(height: 20)
                            .padding(.bottom, 1)
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
                .padding(.bottom)
            }
            .navigationTitle("Profile")
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

struct StatCard: View {
    var label: String
    var value: String
    var icon: String
    var color: Color

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(color.gradient)
                .clipShape(Circle())
            Text(value)
                .font(.title3.bold())
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical)
        .frame(width: 90)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: color.opacity(0.08), radius: 5, x: 0, y: 2)
    }
}



#Preview {
    ProfileView()
}
