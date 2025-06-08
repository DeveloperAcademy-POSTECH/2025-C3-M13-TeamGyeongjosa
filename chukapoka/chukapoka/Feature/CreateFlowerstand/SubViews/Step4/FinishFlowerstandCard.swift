//
//  FinishFlowerstandCard.swift
//  chukapoka
//
//  Created by 조유진 on 6/5/25.
//

import SwiftUI

struct FinishFlowerstandCard: View {
    var selectedColor: Color
    var selectedFlower: String
    var partyName: String
    var ribbonText: String
    
    var body: some View {
        FlowerstandCardView(
            selectedColor: selectedColor,
            selectedFlower: selectedFlower,
            width: 235,
            height: 300
        )
        .overlay(
            HStack(spacing: 100) {
                LeftText(partyName: partyName)
                RightText(ribbonText: ribbonText)
            }
                .padding(.bottom, 8)
        )
    }
}
