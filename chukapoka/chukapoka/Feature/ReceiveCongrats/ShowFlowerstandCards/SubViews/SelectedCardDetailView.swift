//
//  SelectedCardDetailView.swift
//  chukapoka
//
//  Created by 조유진 on 6/8/25.
//

import SwiftUI

struct SelectedCardDetailView: View {
    let card: FlowerstandCardItem
    let onClose: () -> Void

    var body: some View {
        ZStack {
            GSColor.white.opacity(0.6)
                .ignoresSafeArea()
                .onTapGesture {
                    onClose()
                }

            VStack(spacing: 20) {
                HStack {
                    Button(action: onClose) {
                        Image(systemName: "xmark")
                            .font(GSFont.body1)
                            .foregroundColor(GSColor.black)
                            .padding(.horizontal, 32)
                            .padding(.vertical, 12)
                    }

                    Spacer()
                }

                // 확대된 카드
                RoundedRectangle(cornerRadius: 24)
                    .fill(
                        LinearGradient(
                            colors: [card.backgroundColor],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 275, height: 399)
                    .shadow(color: card.backgroundColor.opacity(0.5), radius: 20, x: 0, y: 10)
                    .padding(.bottom, 24)

                Text(card.name)
                    .font(GSFont.title2)
                    .foregroundColor(GSColor.primary)
                +
                Text("님이 보낸 화환")
                    .font(GSFont.title2)
                    .foregroundColor(GSColor.black)
            }
        }
    }
}
