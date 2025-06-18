import SwiftUI

struct AttendanceView: View {
    @StateObject private var viewModel = AttendanceViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Subject-wise Attendance")
                    .font(.title)
                    .bold()
                    .padding(.top)

                ForEach(viewModel.records) { record in
                    AttendanceCard(record: record)
                }
            }
            .padding(.bottom)
        }
        .navigationTitle("Attendance")
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

struct AttendanceCard: View {
    let record: AttendanceRecord
    @State private var animateProgress = false

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 8)
                    .frame(width: 60, height: 60)

                Circle()
                    .trim(from: 0, to: animateProgress ? CGFloat(record.percentage / 100) : 0)
                    .stroke(record.percentage >= 75 ? Color.green : Color.red, lineWidth: 8)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 60, height: 60)
                    .animation(.easeOut(duration: 1), value: animateProgress)

                Text("\(Int(record.percentage))%")
                    .font(.caption)
                    .bold()
            }

            VStack(alignment: .leading) {
                Text(record.subject)
                    .font(.headline)
                Text("Attended \(record.attended) / \(record.total)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
        .padding(.horizontal)
        .onAppear {
            animateProgress = true
        }
    }
}
