//
//  GrievanceViewController.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//
import SwiftUI

struct GrievancePortalView: View {
    @StateObject var viewModel = GrievanceViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                GroupBox(label: Label("Submit a Grievance", systemImage: "exclamationmark.bubble.fill")) {
                    HStack {
                        TextField("Enter your grievance", text: $viewModel.newGrievanceTitle)
                            .textFieldStyle(.roundedBorder)
                        Button(action: {
                            viewModel.submitGrievance()
                        }) {
                            Label("Submit", systemImage: "paperplane")
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(viewModel.newGrievanceTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                    }
                    .padding(.vertical, 2)
                }
                .padding(.vertical, 4)
                .padding(.horizontal)

                Divider()
                
                Text("Past Grievances")
                    .font(.title2.weight(.semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                
                List {
                    ForEach(viewModel.grievances) { item in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title).font(.headline)
                            HStack {
                                Text("Status: \(item.status)")
                                    .font(.caption)
                                    .foregroundColor(item.status == "Resolved" ? .green : .orange)
                                Spacer()
                                Text(item.date, style: .date)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(.insetGrouped)
            }
            .padding(.top)
            .navigationTitle("Grievance Portal")
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}



#Preview {
    GrievancePortalView()
}
