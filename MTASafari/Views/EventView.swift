import SwiftUI

struct EventView: View {
    var event: Event
    var onAction: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text(event.Title)
                .font(.title)
            Text(event.Story)
                .font(.body)
            Button("Perform Action") {
                onAction()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .navigationTitle("Event")
    }
}
