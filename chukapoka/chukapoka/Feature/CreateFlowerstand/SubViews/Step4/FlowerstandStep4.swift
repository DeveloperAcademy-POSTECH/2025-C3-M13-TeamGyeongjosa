//
//  FlowerstandStep4.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerstandStep4: View {
    @ObservedObject var viewModel: CreateFlowerstandViewModel
    
    var body: some View {
        VStack(spacing: 59) {
            Text("\(viewModel.recipientName)님 만의\n화환 카드가 준비되었어요!")
                .font(GSFont.title2)
                .lineSpacing(12)
                .foregroundColor(GSColor.black)
                .multilineTextAlignment(.center)
            
            FinishFlowerstandCard(
                selectedColor: viewModel.selectedColor,
                selectedFlower: viewModel.selectedFlower,
                partyName: viewModel.partyName,
                ribbonText: viewModel.message
            )
        }
        .overlay(
            ForEach(0..<100, id: \.self) { _ in
                ConfettiParticleView()
                    .zIndex(2)
            }
        )
    }
}
