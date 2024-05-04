//  ContentView.swift
//  Space

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Enjoy your evenly spaced Launchpad.")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(VisualEffectView())
            .background(AnimatedBackgroundView())
            .edgesIgnoringSafeArea(.all)
    }
}

struct VisualEffectView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        view.state = .active
        view.material = .hudWindow
        return view
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
    }
}

struct AnimatedBackgroundView: View {
    @State private var gradient = Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .pink])
    @State private var startPoint = UnitPoint.topLeading
    @State private var endPoint = UnitPoint.bottomTrailing

    var body: some View {
        LinearGradient(gradient: gradient, startPoint: startPoint, endPoint: endPoint)
            .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: endPoint)
            .onAppear {
                self.startPoint = .bottomLeading
                self.endPoint = .topTrailing
            }
    }
}
