//
//  FlowerstandCard.swift
//  chukapoka
//
//  Created by 조유진 on 6/7/25.
//

import SwiftUI

struct FlowerstandCard: View {
    let member: PartyMember
    
    var body: some View {
        let parsed = parseFlowerstandPath(member.flowerstandPath)
        
        RoundedRectangle(cornerRadius: 16)
            .fill(
                Color.clear
            )
            .frame(width: 100, height: 145.09)
            .overlay(
                VStack(spacing: 8) {
                    ReceivedFlowerStandCard(
                        selectedColor: parsed.color,
                        selectedFlower: parsed.flower,
                        width: 117.5,
                        height: 150
                    )
                }
                .padding(12)
            )
            .shadow(color: parsed.color.opacity(0.3), radius: 8, x: 0, y: 4)
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
