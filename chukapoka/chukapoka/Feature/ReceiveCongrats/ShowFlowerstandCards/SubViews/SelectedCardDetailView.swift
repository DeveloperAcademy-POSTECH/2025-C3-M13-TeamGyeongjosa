//
//  SelectedCardDetailView.swift
//  chukapoka
//
//  Created by 조유진 on 6/8/25.
//

import SwiftUI

struct SelectedCardDetailView: View {
    let member: PartyMember
    let onClose: () -> Void
    
    var body: some View {
        let parsed = parseFlowerstandPath(member.flowerstandPath ?? "")
        
        ZStack {
            GSColor.white.opacity(0.6)
                .ignoresSafeArea()
                .onTapGesture {
                    onClose()
                }
            
            VStack {
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
                .padding(.bottom, 64)
                
                // 확대된 카드
                FinishFlowerstandCard(
                    selectedColor: parsed.color,
                    selectedFlower: parsed.flower,
                    partyName: member.party?.name ?? "알 수 없음",
                    ribbonText: member.message
                )
                .shadow(color: parsed.color.opacity(0.5), radius: 20, x: 0, y: 10)
                .padding(.bottom, 24)
                
                Text(member.name)
                    .font(GSFont.title2)
                    .foregroundColor(GSColor.primary)
                +
                Text("님이 보낸 화환")
                    .font(GSFont.title2)
                    .foregroundColor(GSColor.black)
                
                Spacer()
            }
            .overlay(
                ForEach(0..<100, id: \.self) { _ in
                    ConfettiParticleView()
                        .zIndex(2)
                }
            )
        }
    }
    
    private func parseFlowerstandPath(_ path: String) -> (flower: String, color: Color) {
        let components = path.split(separator: "_")
        guard components.count == 2 else {
            return ("", GSColor.yellow)
        }
        
        let flower = String(components[0])
        let colorString = String(components[1])
        
        let color: Color
        switch colorString {
        case "Yellow":
            color = GSColor.yellow
        case "Pink":
            color = GSColor.pink
        case "Purple":
            color = GSColor.purple
        default:
            color = GSColor.yellow
        }
        
        return (flower, color)
    }
}
