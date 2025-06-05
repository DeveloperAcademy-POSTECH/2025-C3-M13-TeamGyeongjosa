//
//  FlowerstandStep4.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerstandStep4: View {
    @State private var cardData: FlowerstandCardData = FlowerstandCardData(
        name: "강지수",
        selectedColor: GSColor.yellow,
        selectedFlower: "YellowFlower",
        partyName: "경조사실무팀",
        ribbonText: "행복하세요!"
    )
    
    var body: some View {
        VStack(alignment: .center) {
            FinishFlowerstandContent(cardData: cardData)
            
            Spacer()
            
            PrimaryButton(title: "카드 보내기", style: .basic)
                .padding(.bottom, 30)
        }
        .padding(.horizontal, 16)
    }
}
