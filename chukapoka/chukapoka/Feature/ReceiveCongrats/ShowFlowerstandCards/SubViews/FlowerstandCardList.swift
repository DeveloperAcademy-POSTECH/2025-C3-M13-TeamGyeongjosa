import SwiftUI

struct FlowerstandCardList: View {
    @State private var selectedCard: FlowerstandCardItem?
    @State private var currentRotation: Double = 0
    @State private var isDragging: Bool = false
    
    let cards = [
        FlowerstandCardItem(name: "데미안", backgroundColor: GSColor.primary),
        FlowerstandCardItem(name: "유우", backgroundColor: GSColor.secondary1),
        FlowerstandCardItem(name: "모세", backgroundColor: GSColor.secondary2),
        FlowerstandCardItem(name: "젠키", backgroundColor: GSColor.purple),
        FlowerstandCardItem(name: "웨이", backgroundColor: GSColor.yellow),
        FlowerstandCardItem(name: "위시", backgroundColor: GSColor.pink)
    ]
    
    var body: some View {
        ZStack {
            GSColor.white.ignoresSafeArea()
            
            VStack {
                // 원형 카드 컨테이너
                GeometryReader { geometry in
                    let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    let radius: CGFloat = 130
                    
                    ZStack {
                        ForEach(Array(cards.enumerated()), id: \.element.id) { index, card in
                            let cardAngle = Double(index) * 180 / Double(cards.count)
                            let totalAngle = cardAngle + currentRotation
                            let radians = totalAngle * .pi / 180
                            
                            let xPos = center.x + radius * cos(radians)
                            let yPos = center.y + radius * sin(radians)
                            
                            // 카드의 거리에 따른 스케일링
                            let distanceFromFront = abs(sin(radians))
                            let cardScale = 0.8 + (1 - distanceFromFront) * 0.4
                            let cardOpacity = 0.6 + (1 - distanceFromFront) * 0.4
                            let cardZIndex = 1 - distanceFromFront
                            
                            FlowerstandCard(card: card)
                                .scaleEffect(cardScale)
                                .opacity(cardOpacity)
                                .position(x: xPos, y: yPos)
                                .zIndex(cardZIndex)
                                .onTapGesture {
                                    // 드래그 중이 아닐 때만 선택 가능
                                    if !isDragging {
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            selectedCard = card
                                        }
                                    }
                                }
                                // 각 카드에 개별 애니메이션 적용
                                .animation(.none, value: currentRotation)
                        }
                        
                        // 중앙 컨트롤 구
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [GSColor.cardRed1, GSColor.cardRed2, GSColor.cardYellow],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 80, height: 80)
                            .position(center)
                            .shadow(color: GSColor.secondary2.opacity(0.5), radius: 20, x: 0, y: 0)
                    }
                    .padding(.top, 100)
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            isDragging = true
                            let rotationSensitivity: Double = 0.7
                            let translationX = Double(value.translation.width)
                            currentRotation = translationX * rotationSensitivity
                        }
                        .onEnded { _ in
                            // 드래그 종료 후 스냅 효과
                            let cardAngle = 180 / Double(cards.count)
                            let snappedRotation = round(currentRotation / cardAngle) * cardAngle
                            
                            withAnimation(.interpolatingSpring(stiffness: 100, damping: 15)) {
                                currentRotation = snappedRotation
                            }
                            
                            // 0.1초 후 드래그 상태 해제 (애니메이션 완료 대기)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isDragging = false
                            }
                        }
                )
            }
            
            // 상세 카드 오버레이
            if let card = selectedCard {
                SelectedCardDetailView(card: card) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        selectedCard = nil
                    }
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
    }
}

struct FlowerstandCardList_Previews: PreviewProvider {
    static var previews: some View {
        FlowerstandCardList()
    }
}
