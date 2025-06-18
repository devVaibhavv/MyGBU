import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var profileVM: ProfileViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // MARK: Profile Snippet
                    ProfileSnippetView(student: $profileVM.student)

                    // MARK: Quick Actions Row
                    QuickActionsRow()

                    // MARK: Dashboard Cards
                    VStack(spacing: 16) {
                        DashboardCard(title: "Fee Due", value: "₹12,000", icon: "creditcard.fill", color: .orange)
                        DashboardCard(title: "Pending Assignments", value: "3", icon: "doc.text.fill", color: .red)
                    }
                    .padding(.horizontal)

                    // MARK: Statistics Section
                    StatisticsSection()
                }
                .padding(.top)
            }
            .navigationTitle("Dashboard")
        }
    }
}

struct DashboardCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 24, height: 24)
                .padding()
                .background(color.opacity(0.2))
                .foregroundColor(color)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(value)
                    .font(.headline)
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 1)
    }
}

struct StatBox: View {
    let title: String
    let value: String

    var body: some View {
        VStack {
            Text(value)
                .font(.title2.bold())
                .foregroundColor(.blue)
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 1)
    }
}

struct QuickAction: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
}
