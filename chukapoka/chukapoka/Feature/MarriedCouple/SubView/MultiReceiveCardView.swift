//
//  MultiReceiveCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import SwiftUI

struct MultiReceiveCardView: View {
    let parties: [Party]
    @Binding var currentIndex: Int
    let screenWidth: CGFloat
    let cardWidth: CGFloat
    let spacing: CGFloat
    let xOffset: CGFloat
    
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(parties.indices, id: \.self) { index in
                ReceiveCardView(party: parties[index])
                    .frame(width: cardWidth)
                    .scaleEffect(scale(for: index)) // 현재 카드 크기 강조
                    .opacity(opacity(for: index))   // 투명도 조절
                    .animation(.easeInOut(duration: 0.2), value: currentIndex)
            }
        }
        .frame(width: screenWidth, alignment: .leading)
        .offset(x: -CGFloat(currentIndex) * (cardWidth + spacing) + dragOffset + xOffset)
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation.width
                }
                .onEnded { value in
                    let threshold = cardWidth * 0.25
                    let predicted = value.predictedEndTranslation.width - value.translation.width
                    
                    if value.translation.width < -threshold || predicted < -50 {
                        currentIndex = min(currentIndex + 1, parties.count - 1)
                    } else if value.translation.width > threshold || predicted > 50 {
                        currentIndex = max(currentIndex - 1, 0)
                    }
                }
        )
    }
    
    private func scale(for index: Int) -> CGFloat {
        index == currentIndex ? 1.0 : 0.9
    }
    
    private func opacity(for index: Int) -> Double {
        index == currentIndex ? 1.0 : 0.6
    }
}
