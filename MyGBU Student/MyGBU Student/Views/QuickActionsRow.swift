//
//  QuickActionsRow.swift
//  MyGBU Student
//
//  Created by Vaibhav Singh on 18/06/25.
//


struct QuickActionsRow: View {
    let quickActions = [
        QuickAction(title: "Timetable", icon: "calendar"),
        QuickAction(title: "Results", icon: "doc.plaintext"),
        QuickAction(title: "Attendance", icon: "checkmark.circle"),
        QuickAction(title: "Fees", icon: "creditcard"),
        QuickAction(title: "Library", icon: "books.vertical"),
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(quickActions) { action in
                    Button(action: {
                        // Placeholder: add navigation action
                    }) {
                        VStack {
                            Image(systemName: action.icon)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .clipShape(Circle())
                            Text(action.title)
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                        .frame(width: 80)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
