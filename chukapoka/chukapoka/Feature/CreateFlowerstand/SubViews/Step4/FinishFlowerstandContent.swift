//
//  FinishFlowerstandContent.swift
//  chukapoka
//
//  Created by 조유진 on 6/5/25.
//

import SwiftUI

struct FinishFlowerstandContent: View {
    var cardData: FlowerstandCardData

    var body: some View {
        Spacer()
        
        VStack(spacing: 59) {
            Text("\(cardData.name)님 만의\n화환 카드가 준비되었어요!")
                .font(GSFont.title2)
                .foregroundColor(GSColor.black)
                .multilineTextAlignment(.center)
            
            FinishFlowerstandCard(
                selectedColor: cardData.selectedColor,
                selectedFlower: cardData.selectedFlower,
                partyName: cardData.partyName,
                ribbonText: cardData.ribbonText
            )
        }
    }
}
