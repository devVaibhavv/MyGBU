import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "house.fill")
                }

            SubjectsView()
                .tabItem {
                    Label("Subjects", systemImage: "book.fill")
                }

            TimetableView()
                .tabItem {
                    Label("Timetable", systemImage: "calendar")
                }

            AttendanceView()
                .tabItem {
                    Label("Attendance", systemImage: "chart.pie.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}
