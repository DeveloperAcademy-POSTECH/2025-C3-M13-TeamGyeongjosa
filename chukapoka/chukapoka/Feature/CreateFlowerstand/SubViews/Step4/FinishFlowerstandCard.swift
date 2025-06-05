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
            width: 275,
            height: 399
        )
        .overlay(
            HStack(spacing: 105) {
                LeftText(partyName: partyName)
                RightText(ribbonText: ribbonText)
            }
                .padding(.bottom, 12)
        )
    }
}
