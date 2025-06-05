//
//  FlowerstandStep2.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerstandStep2: View {
    @State private var selectedColor: Color = GSColor.yellow
    @State private var selectedFlower: String = "YellowFlower"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 39) {
            Text("진심을 담아\n나만의 화환 카드를 꾸며보세요!")
                .font(GSFont.title2)
                .foregroundColor(GSColor.black)
            
            VStack(spacing: 28) {
                VStack(spacing: 45) {
                    FlowerstandCardView(
                        selectedColor: selectedColor,
                        selectedFlower: selectedFlower
                    )
                    
                    CardDecorationPicker(
                        selectedColor: $selectedColor,
                        selectedFlower: $selectedFlower)
                }
                
                PrimaryButton(title: "다음", style: .basic)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    FlowerstandStep2()
}
