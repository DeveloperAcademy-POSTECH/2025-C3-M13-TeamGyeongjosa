//
//  MemberShowFlowerView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

struct MemberShowFlowerView: View {
    @ObservedObject var viewModel: MemberJoinViewModel
    
    var body: some View {
        VStack(spacing: 59) {
            Text("\(viewModel.senderName)님 만의\n화환 카드가 준비되었어요!")
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
