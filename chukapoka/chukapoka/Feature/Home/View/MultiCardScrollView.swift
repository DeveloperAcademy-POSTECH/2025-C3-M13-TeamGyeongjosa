//
//  MultiCardScrollView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

struct MultiCardScrollView: View {
    let parties: [Party]
    @Binding var currentIndex: Int
    @GestureState var dragOffset: CGFloat
    @Environment(\.modelContext) private var modelContext
    
    let screenWidth: CGFloat
    let cardWidth: CGFloat
    let spacing: CGFloat
    let xOffset: CGFloat
    let viewModel: MultiCardViewModel
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(parties.indices, id: \.self) { index in
                FlippableCardView(
                    name: parties[index].wedding?.accountName ?? "신랑신부",
                    groupName: parties[index].name,
                    weddingDate: parties[index].wedding?.date ?? Date(),
                    weddingPlace: parties[index].wedding?.place ?? "장소없음",
                    state: PartyCardState.from(date: parties[index].wedding?.date ?? Date()),
                    inviteCode: parties[index].inviteCode,
                    onTapPhoto: {},
                    onTapClose: {
                        let isLast = parties.count - 1 == index
                        
                        withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.8)) {
                            if isLast && currentIndex > 0 {
                                currentIndex -= 1
                            }
                        }
                        
                        // 약간의 지연 후 실제 삭제 수행 (애니메이션 끝난 뒤)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            viewModel.deleteParty(parties[index], context: modelContext)
                            
                        }
                    }
                )
                .frame(width: cardWidth)
                .opacity(viewModel.opacity(for: index, current: currentIndex))
                .scaleEffect(viewModel.scale(for: index, current: currentIndex))
            }
        }
        .frame(width: screenWidth, alignment: .leading)
        .offset(x: -CGFloat(currentIndex) * (cardWidth + spacing) + dragOffset + xOffset)
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation.width
                }
                .onEnded { value in
                    let threshold = cardWidth * 0.25
                    let predicted = value.predictedEndTranslation.width - value.translation.width
                    
                    if value.translation.width < -threshold || predicted < -50 {
                        currentIndex = min(currentIndex + 1, parties.count - 1)
                    } else if value.translation.width > threshold || predicted > 50 {
                        currentIndex = max(currentIndex - 1, 0)
                    }
                }
        )
        .animation(.interactiveSpring(response: 0.3, dampingFraction: 0.8), value: currentIndex)
    }
}
