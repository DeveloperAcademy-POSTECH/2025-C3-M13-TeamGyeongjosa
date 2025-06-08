//
//  FlowerstandCard.swift
//  chukapoka
//
//  Created by 조유진 on 6/7/25.
//

import SwiftUI

struct FlowerstandCard: View {
    // 화환 이미지 저장 기능 구현 후 이미지로 대체
    let card: FlowerstandCardItem
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(
                LinearGradient(
                    colors: [card.backgroundColor, card.backgroundColor.opacity(0.7)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 100, height: 145.09)
            .overlay(
                VStack(spacing: 8) {
                    Text(card.name)
                        .font(GSFont.body1)
                        .foregroundColor(.white)
                }
                .padding(12)
            )
            .shadow(color: card.backgroundColor.opacity(0.3), radius: 8, x: 0, y: 4)
    }
}
