//
//  ConfettiParticleView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import SwiftUI

struct ConfettiParticleView: View {
    // 초기 위치를 화면 전체 랜덤으로!
    @State private var startX: CGFloat = .random(in: -200...200)
    @State private var startY: CGFloat = .random(in: -600...(-100))
    @State private var endY: CGFloat = .random(in: 400...900)
    @State private var opacity: Double = 1.0
    @State private var scale: CGFloat = .random(in: 0.5...1.5)
    @State private var rotation: Angle = .degrees(.random(in: 0...360))
    
    var body: some View {
        Circle()
            .fill(randomColor())
            .frame(width: 8 * scale, height: 8 * scale)
            .rotationEffect(rotation)
            .offset(x: startX, y: startY)
            .opacity(opacity)
            .onAppear {
                withAnimation(.interpolatingSpring(stiffness: 10, damping: 5).speed(.random(in: 0.5...1.5))) {
                    startY = endY
                    opacity = 0
                    rotation = .degrees(Double.random(in: 360...1080))
                }
            }
    }
    
    private func randomColor() -> Color {
        [
            .pink.opacity(0.9),
            .yellow.opacity(0.9),
            .mint.opacity(0.9),
            .blue.opacity(0.9),
            .purple.opacity(0.9),
            .orange.opacity(0.9)
        ].randomElement()!
    }
}
