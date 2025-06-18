import SwiftUICore
import SwiftUI

struct ProfileSnippetView: View {
    let student: StudentProfile

    var body: some View {
        NavigationLink(destination: ProfileView()) {
            HStack(spacing: 16) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)

                VStack(alignment: .leading) {
                    Text(student.name)
                        .font(.headline)

                    Text(student.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 1)
            .padding(.horizontal)
        }
    }
}
