//
//  ResultsView.swift
//  MyGBU Student
//
//  Created by Vaibhav Singh on 18/06/25.
//


import SwiftUI

struct ResultsView: View {
    @StateObject private var viewModel = ResultsViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Exam Results")
                    .font(.title)
                    .bold()
                    .padding(.top)

                ForEach(viewModel.results) { result in
                    ResultCard(result: result)
                }
            }
            .padding(.bottom)
        }
        .navigationTitle("Results")
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

struct ResultCard: View {
    let result: ExamResult
    @State private var animateBar = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(result.subject)
                    .font(.headline)
                Spacer()
                Text(result.grade)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(result.gradeColor)
            }

            Text("Score: \(result.marksObtained)/\(result.totalMarks)")
                .font(.subheadline)
                .foregroundColor(.gray)

            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 10)

                Capsule()
                    .fill(result.gradeColor)
                    .frame(width: animateBar ? CGFloat(result.percentage) * 2 : 0, height: 10)
                    .animation(.easeOut(duration: 1.2), value: animateBar)
            }

            Text("\(Int(result.percentage))%")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
        .padding(.horizontal)
        .onAppear {
            animateBar = true
        }
    }
}
