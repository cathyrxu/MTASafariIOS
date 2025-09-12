import SwiftUI

struct UserStatusView: View {
    var user: User

    var body: some View {
        VStack(spacing: 20) {
            Text("User Status")
                .font(.largeTitle)
            Text("HP: \(user.HP)")
            Text("Money: \(user.Money)")
            Text("Sanity: \(user.Sanity)")
            Text("Moves: \(user.Moves)")
        }
        .padding()
        .navigationTitle("User Status")
    }
}
