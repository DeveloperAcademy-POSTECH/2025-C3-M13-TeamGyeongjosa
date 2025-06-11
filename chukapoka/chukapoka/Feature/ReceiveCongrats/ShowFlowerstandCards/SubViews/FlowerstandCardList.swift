import SwiftUI

struct FlowerstandCardList: View {
    @State private var selectedMember: PartyMember?
    @State private var currentRotation: Double = 0
    @State private var isDragging: Bool = false
    
    let members: [PartyMember]
    
    init(members: [PartyMember] = []) {
        self.members = members
    }
    
    var body: some View {
        ZStack {
            GSColor.white.ignoresSafeArea()
            
            VStack {
                // 원형 카드 컨테이너
                GeometryReader { geometry in
                    let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    let radius: CGFloat = 130
                    
                    ZStack {
                        ForEach(Array(members.enumerated()), id: \.element.id) { index, member in
                            let cardAngle = Double(index) * 180 / Double(members.count)
                            let totalAngle = cardAngle + currentRotation
                            let radians = totalAngle * .pi / 180
                            
                            let xPos = center.x + radius * cos(radians)
                            let yPos = center.y + radius * sin(radians)
                            
                            // 카드의 거리에 따른 스케일링
                            let distanceFromFront = abs(sin(radians))
                            let cardScale = 0.8 + (1 - distanceFromFront) * 0.4
                            let cardOpacity = 0.6 + (1 - distanceFromFront) * 0.4
                            let cardZIndex = 1 - distanceFromFront
                            
                            FlowerstandCard(member: member)
                                .scaleEffect(cardScale)
                                .opacity(cardOpacity)
                                .position(x: xPos, y: yPos)
                                .zIndex(cardZIndex)
                                .onTapGesture {
                                    // 드래그 중이 아닐 때만 선택 가능
                                    if !isDragging {
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            selectedMember = member
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
                                    colors: [GSColor.primary, GSColor.secondary2, GSColor.secondary1],
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
                            let cardAngle = 180 / Double(members.count)
                            let snappedRotation = round(currentRotation / cardAngle) * cardAngle
                            
                            // 스냅 햅틱 피드백 추가
                            let impactFeedback = UIImpactFeedbackGenerator(style: .rigid)
                            impactFeedback.impactOccurred()
                            
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
            .padding(.bottom, 240)
            
            if let member = selectedMember {
                SelectedCardDetailView(member: member) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        selectedMember = nil
                    }
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
    }
}

struct FlowerstandCardList_Previews: PreviewProvider {
    static var previews: some View {
        let mockMembers = [
            PartyMember(isLeader: false, name: "데미안", accountNumber: "", phoneNumber: "", money: nil, message: "축하해!", flowerstandPath: "RedFlower_Pink"),
            PartyMember(isLeader: false, name: "유우", accountNumber: "", phoneNumber: "", money: nil, message: "행복하세요!", flowerstandPath: "BlueFlower_Yellow"),
            PartyMember(isLeader: false, name: "모세", accountNumber: "", phoneNumber: "", money: nil, message: "잘 살아!", flowerstandPath: "PinkFlower_Purple")
        ]
        FlowerstandCardList(members: mockMembers)
    }
}
