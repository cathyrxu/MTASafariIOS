import SwiftUI

struct ActionResultView: View {
    var resultMessage: String
    var user: User

    var body: some View {
        VStack(spacing: 20) {
            Text(resultMessage)
                .font(.headline)
            Text("User Status:")
                .font(.title2)
            Text("HP: \(user.HP)")
            Text("Money: \(user.Money)")
            Text("Sanity: \(user.Sanity)")
            Text("Moves: \(user.Moves)")
        }
        .padding()
        .navigationTitle("Action Result")
    }
}
