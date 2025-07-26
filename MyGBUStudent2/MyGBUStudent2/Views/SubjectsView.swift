//
//  SubjectsViewController.swift
//  MyGBUStudent2
//
//  Created by Vaibhav Singh on 26/07/25.
//
import SwiftUI

import SwiftUI
import UniformTypeIdentifiers

struct SubjectsView: View {
    @StateObject var viewModel = SubjectsViewModel()
    @State private var selectedSubject: Subject? = nil
    @State private var showSubjectSheet: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 170), spacing: 16)], spacing: 22) {
                    ForEach(viewModel.subjects, id: \.id) { subject in
                        Button(action: {
                            selectedSubject = subject
                            showSubjectSheet = true
                        }) {
                            VStack(spacing: 10) {
                                Image(systemName: "book.fill")
                                    .font(.largeTitle).foregroundColor(.blue)
                                    .frame(width: 50, height: 50)
                                    .background(.ultraThinMaterial)
                                    .clipShape(Circle())
                                Text(subject.name)
                                    .font(.headline)
                                Text("Attendance: \(String(format: "%.1f%%", subject.attendance.percentage))")
                                    .font(.subheadline)
                                    .foregroundColor(subject.attendance.percentage < 75 ? .red : .green)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.thinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: .purple.opacity(0.05), radius: 5, x: 0, y: 2)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Subjects")
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .sheet(item: $selectedSubject) { subj in
                SubjectDetailSheet(subject: subj, submitAction: { fileURL in
                    // Simulate submitting file. Integrate API here.
                    print("Submitting file URL: \(fileURL?.lastPathComponent ?? "None") for subject: \(subj.name)")
                })
            }
        }
    }
}

struct SubjectDetailSheet: View {
    var subject: Subject
    var submitAction: (URL?) -> Void

    @State private var showDocPicker = false
    @State private var selectedFileURL: URL? = nil

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    Text(subject.name)
                        .font(.largeTitle.bold())

                    GroupBox(label: Label("Your Attendance", systemImage: "person.crop.circle.badge.checkmark")) {
                        HStack {
                            Text(String(format: "%.1f%%", subject.attendance.percentage))
                                .font(.title.bold())
                                .foregroundColor(subject.attendance.percentage < 75 ? .red : .green)
                            Spacer()
                        }.padding(.vertical, 4)
                    }

                    if let assignment = subject.assignments.first {
                        GroupBox(label: Label("Assignment", systemImage: "doc.text.fill")) {
                            Text(assignment.title)
                                .font(.headline)
                            Text("Due: \(assignment.dueDate.formatted(.dateTime.month().day().year()))")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            if let note = assignment.facultyNotes {
                                HStack {
                                    Image(systemName: "quote.bubble")
                                        .foregroundColor(.blue)
                                    Text(note)
                                        .font(.body)
                                        .foregroundColor(.blue)
                                }
                            }

                            Divider().padding(.vertical, 2)
                            // Simulated: open assignment PDF
                            Button {
                                // Show PDF or simulate
                            } label: {
                                Label("View Assignment PDF", systemImage: "doc.richtext")
                            }
                            .buttonStyle(.borderedProminent)
                            .padding(.bottom, 6)

                            // File attach and submit
                            if !assignment.isSubmitted {
                                Button {
                                    showDocPicker = true
                                } label: {
                                    Label(selectedFileURL == nil ? "Attach PDF" : selectedFileURL!.lastPathComponent, systemImage: "paperclip")
                                }
                                .buttonStyle(.bordered)
                                .padding(.vertical, 2)

                                Button {
                                    submitAction(selectedFileURL)
                                } label: {
                                    Label("Submit Assignment", systemImage: "paperplane.fill")
                                }
                                .buttonStyle(.borderedProminent)
                                .disabled(selectedFileURL == nil)
                            } else {
                                HStack {
                                    Image(systemName: "checkmark.seal.fill")
                                        .foregroundColor(.green)
                                    Text("Assignment submitted")
                                        .foregroundColor(.green)
                                }
                            }
                        }
                    } else {
                        Text("No assignments assigned yet.")
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        // handled by .sheet(item:)
                    }
                }
            }
            // Document picker
            .sheet(isPresented: $showDocPicker, content: {
                DocumentPickerView(selectedFile: $selectedFileURL)
            })
        }
    }
}

// System document picker for PDF only
import UIKit
struct DocumentPickerView: UIViewControllerRepresentable {
    @Binding var selectedFile: URL?

    func makeCoordinator() -> Coordinator { Coordinator(self) }
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: [UTType.pdf], asCopy: true)
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ vc: UIDocumentPickerViewController, context: Context) {}

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let parent: DocumentPickerView
        init(_ parent: DocumentPickerView) { self.parent = parent }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            parent.selectedFile = urls.first
        }
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {}
    }
}


#Preview {
    SubjectsView()
}
