//
//  CircleProgress.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct CircleProgress: View {
//    @State private var step: Int = 0
    
    // 외부에서 주입
    let step: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(GSColor.primary)
                .frame(width: 50, height: 1)
            
            HStack(spacing: 11) {
                ForEach(0..<3) { index in
                    Circle()
                        .fill(step >= index ? GSColor.primary : GSColor.white)
                        .frame(width: 15, height: 15)
                        .overlay(
                            Circle()
                                .stroke(GSColor.primary, lineWidth: 1)
                        )
                        .animation(.easeInOut(duration: 0.3), value: step)
                }
            }
        }
        .padding(16)
    }
}

#Preview {
    CircleProgress(step: 5)
}
