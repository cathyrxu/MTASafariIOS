import SwiftUI

struct EventView: View {
    var event: Event
    var onAction: (ActionConfig) -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text(event.Title)
                .font(.title)
            Text(event.Story)
                .font(.body)
            if event.EventType == .normal || event.EventType == .special {
                Button("OK") {
                    onAction(event.actions[0])
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            } else if event.EventType == .check {
                ForEach(Array(event.actions.enumerated()), id: \.offset) { index, actionConfig in
                    Button(index == 0 ? "成功" : "失败") {
                        onAction(actionConfig)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
        }
        .padding()
        .navigationTitle("Event")
        }
    }
