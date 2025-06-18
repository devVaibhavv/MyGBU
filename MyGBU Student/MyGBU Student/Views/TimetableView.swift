import SwiftUI

struct TimetableView: View {
    @StateObject private var viewModel = TimetableViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(viewModel.timetable.keys.sorted(), id: \.self) { day in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(day)
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)

                        ForEach(viewModel.timetable[day] ?? []) { slot in
                            TimetableCard(slot: slot)
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Timetable")
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

struct TimetableCard: View {
    let slot: TimetableSlot

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(slot.period)
                    .font(.headline)
                Spacer()
                Text(slot.location)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Text(slot.subject)
                .font(.title3)
                .bold()
            Text("Instructor: \(slot.instructor)")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}
