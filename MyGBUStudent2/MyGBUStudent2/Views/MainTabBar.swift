//
//  MainTabBarController.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem { Label("Dashboard", systemImage: "rectangle.grid.2x2.fill") }
            TimetableView()
                .tabItem { Label("Timetable", systemImage: "calendar") }
            SubjectsView()
                .tabItem { Label("Subjects", systemImage: "book.closed.fill") }
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.fill") }
            GrievancePortalView()
                .tabItem { Label("Grievance", systemImage: "exclamationmark.bubble.fill") }
        }
    }
}


#Preview {
    MainTabView()
}
