import SwiftUI

struct SubjectsView: View {
    @State private var subjects = [
        Subject(id: 1, name: "Mathematics", Faculty: "Dr. Sharma"),
        Subject(id: 2, name: "Physics", Faculty: "Dr. Rao"),
        Subject(id: 3, name: "Computer Science", Faculty: "Prof. Nair")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(subjects) { subject in
                        SubjectCard(subject: subject)
                            .padding(.horizontal)
                            .transition(.slide)
                            .animation(.spring(), value: subject)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Subjects")
        }
    }
}

struct SubjectCard: View {
    let subject: Subject

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(subject.name)
                .font(.headline)
            Text("Faculty: \(subject.Faculty)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}
