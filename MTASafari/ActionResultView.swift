import SwiftUI

struct ActionResultView: View {
    var resultMessage: String
    var user: User
    var actionConfig: ActionConfig
    var onBack: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text(resultMessage)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            // Display changes if any
            if hasChanges() {
                VStack(spacing: 10) {
                    Text("Changes")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    if actionConfig.HPChange != 0 {
                        HStack {
                            Text("HP:")
                            Text("\(actionConfig.HPChange > 0 ? "+" : "")\(actionConfig.HPChange)")
                                .foregroundColor(actionConfig.HPChange > 0 ? .green : .red)
                        }
                    }
                    
                    if actionConfig.MoneyChange != 0 {
                        HStack {
                            Text("Money:")
                            Text("\(actionConfig.MoneyChange > 0 ? "+" : "")\(actionConfig.MoneyChange)")
                                .foregroundColor(actionConfig.MoneyChange > 0 ? .green : .red)
                        }
                    }
                    
                    if actionConfig.SanityChange != 0 {
                        HStack {
                            Text("Sanity:")
                            Text("\(actionConfig.SanityChange > 0 ? "+" : "")\(actionConfig.SanityChange)")
                                .foregroundColor(actionConfig.SanityChange > 0 ? .green : .red)
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
            
            // Display round effects
            if actionConfig.SkipRound || actionConfig.RepeatRound {
                VStack(spacing: 10) {
                    Text("Round Effects")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    if actionConfig.SkipRound {
                        Text("Skip Round")
                            .foregroundColor(.blue)
                            .fontWeight(.semibold)
                    }
                    
                    if actionConfig.RepeatRound {
                        Text("Repeat Round")
                            .foregroundColor(.orange)
                            .fontWeight(.semibold)
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
            }
            
            // Current status
            VStack(spacing: 10) {
                Text("Current Status")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("HP: \(user.HP)")
                Text("Money: \(user.Money)")
                Text("Sanity: \(user.Sanity)")
                Text("Moves: \(user.Moves)")
            }
            .padding()
            .background(Color.green.opacity(0.1))
            .cornerRadius(10)
            
            // Back button
            Button(action: onBack) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text("Back")
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Action Result")
    }
    
    private func hasChanges() -> Bool {
        return actionConfig.HPChange != 0 || actionConfig.MoneyChange != 0 || actionConfig.SanityChange != 0
    }
}
