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
    
    private let viewModel = MultiCardViewModel()
    @Environment(\.modelContext) private var ModelContext
    
    let onCopy: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let cardWidth = screenWidth * 0.85
            let spacing: CGFloat = 8
            let xOffset = (screenWidth - cardWidth) / 2  // 중앙 정렬 보정
            
            if parties.count == 1 {
                // 카드 1장: 그냥 중앙 정렬
                HStack {
                    Spacer()
                    SingleCardView(
                        party: parties[0],
                        width: cardWidth,
                        onTapClose: {
                            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.8)) {
                                viewModel.deleteParty(parties[0], context: ModelContext)
                                currentIndex = 0
                            }
                        },
                        onCopy: onCopy
                    )
                    
                    Spacer()
                }
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
                    viewModel: viewModel,
                    onCopy: onCopy
                )
            }
        }
        .frame(height: 525)
    }
}
