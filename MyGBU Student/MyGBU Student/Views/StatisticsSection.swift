//
//  StatisticsSection.swift
//  MyGBU Student
//
//  Created by Vaibhav Singh on 18/06/25.
//


struct StatisticsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Statistics")
                .font(.title2.bold())
                .padding(.horizontal)

            HStack {
                StatBox(title: "Classes", value: "45")
                StatBox(title: "Tests", value: "7")
                StatBox(title: "Projects", value: "2")
            }
            .padding(.horizontal)
        }
    }
}
