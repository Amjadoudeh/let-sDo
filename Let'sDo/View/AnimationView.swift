import SwiftUI

struct AnimationView: View {
    @State var isAnimating = false

    var animation: Animation {
        .interpolatingSpring(stiffness: 0.5, damping: 0.5)
        .repeatForever()
        .delay(isAnimating ? .random(in: 0...1) : 0)
        .speed(isAnimating ? .random(in: 0...1) : 0)
    }
    let emojes = ["💡", "🗓", "📝", "🔔", "🏝", "🔥", "🥳", "🥇", "👍🏽", "👎🏻", "🛏", "🎶", "😂", "🚀", "🚲", "🔍", "⚒", "📨", "🤔", "📊", "💸"]
    var body: some View {
        GeometryReader { proxy in
            VStack {

                // MARK: Images
                ZStack {
                    Color.clear.frame(height: 550)
                    Spacer()
                    VStack {
                        ForEach(0..<18) { item in
                            Text("\(emojes[item])")
                                .font(.system(size: 30))
                                .position(x: .random(in: 0...proxy.size.width / 1.2),
                                          y: .random(in: 0...proxy.size.height / 1.2)
                                )
                                .animation(animation, value: isAnimating)

                        }
                    }
                }
                Spacer()

            }
        }
        .onAppear {
            isAnimating.toggle()

        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
