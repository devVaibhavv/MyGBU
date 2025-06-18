import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State private var showDetails = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                if let profile = viewModel.profile {
                    ScrollView {
                        VStack(spacing: 20) {
                            // Avatar + Name Section
                            VStack {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.blue)
                                    .padding(.bottom, 8)

                                Text(profile.name)
                                    .font(.title2)
                                    .bold()
                                Text("ID: \(profile.studentID)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(16)
                            .shadow(radius: 4)
                            .padding(.horizontal)
                            .animation(.easeIn(duration: 0.3), value: profile)

                            // Details Card
                            VStack(alignment: .leading, spacing: 12) {
                                ProfileRow(label: "Branch", value: profile.branch)
                                ProfileRow(label: "Semester", value: "\(profile.semester)")
                                ProfileRow(label: "Email", value: profile.email)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.white)
                            .cornerRadius(16)
                            .shadow(radius: 4)
                            .padding(.horizontal)
                            .animation(.easeInOut(duration: 0.3), value: profile)

                            // Action Buttons
                            VStack(spacing: 12) {
                                Button(action: {
                                    // TODO: Edit action
                                }) {
                                    Text("Edit Profile")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }

                                Button(action: {
                                    // TODO: Logout logic
                                }) {
                                    Text("Logout")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.red)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                            }
                            .padding(.horizontal)
                            .transition(.move(edge: .bottom))
                            .animation(.spring(), value: profile)
                        }
                        .padding(.top)
                    }
                } else {
                    ProgressView("Loading Profile...")
                        .transition(.opacity)
                        .animation(.easeIn(duration: 0.3), value: viewModel.profile)
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label + ":")
                .fontWeight(.medium)
            Spacer()
            Text(value)
                .foregroundColor(.gray)
        }
    }
}
