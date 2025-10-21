import SwiftUI

struct ContentView: View {
    var activities = ["Archery", "Baseball", "Golf", "Soccer", "Tennis"]
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]
    
    @State private var selected = "Golf"
    @State private var id = 1
    @State private var currentColor: Color = .blue // Ny state för färg

    var body: some View {
        ZStack {
            LinearGradient(colors: [.orange, .red, .purple],                startPoint: .topLeading,
                           endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack {
                Text("Why not try...")
                    .font(.largeTitle.bold())
                    .padding(.top)

                Spacer()

                VStack {
                    Circle()
                        .fill(currentColor)
                        .shadow(radius: 10)
                        .padding()
                        .overlay(
                            Image(systemName: "figure.\(selected.lowercased())")
                                .font(.system(size: 144))
                                .foregroundColor(.white)
                        )
                    Text("\(selected)!")
                        .font(.title)
                }
                .transition(.slide)
                .id(id)

                Spacer()

                Button("Try again") {
                    withAnimation(.easeInOut(duration: 1)) {
                        selected = activities.randomElement() ?? "Golf"
                        currentColor = colors.randomElement() ?? .blue
                        id += 1
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding(.bottom)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
