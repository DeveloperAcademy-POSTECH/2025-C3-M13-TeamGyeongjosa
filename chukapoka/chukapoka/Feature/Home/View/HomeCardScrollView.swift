//
//  HomeCardScrollView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

struct CardScrollView: View {
    let parties: [Party]
    @Binding var currentIndex: Int
    @GestureState private var dragOffset: CGFloat = 0
    private let viewModel = CardViewStateModel()
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let cardWidth = screenWidth * 0.85
            let spacing: CGFloat = 8
            let xOffset = (screenWidth - cardWidth) / 2  // 중앙 정렬 보정
            
            if parties.count == 1 {
                // 카드 1장: 그냥 중앙 정렬
                SingleCardView(party: parties[0], width: cardWidth)
            } else {
                // 여러 장: 스와이프 가능 + 중앙 카드
                MultiCardScrollView(
                    parties: parties,
                    currentIndex: $currentIndex,
                    dragOffset: dragOffset,
                    screenWidth: screenWidth,
                    cardWidth: cardWidth,
                    spacing: spacing,
                    xOffset: xOffset,
                    viewModel: viewModel
                )
            }
        }
        .frame(height: 525)
    }
}
