//
//  ReceiveCardContainerView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import SwiftUI

struct ReceiveCardContainerView: View {
    let parties: [Party]
    @Binding var currentIndex: Int
    @GestureState private var drageOffset: CGFloat = 0
    
    private let viewModel = MultiCardViewModel()
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let cardWidth = screenWidth * 0.8
            let spacing: CGFloat = 8
            let xOffset = (screenWidth - cardWidth) / 2
            
            if parties.count == 1 {
                HStack {
                    Spacer()
                    ReceiveSingleCardView(
                        party: parties[0],
                        width: cardWidth
                    )
                    Spacer()
                }
            } else {
                MultiReceiveCardView(
                    parties: parties,
                    currentIndex: $currentIndex,
                    screenWidth: screenWidth,
                    cardWidth: cardWidth,
                    spacing: spacing,
                    xOffset: xOffset
                )
            }
        }
    }
}
