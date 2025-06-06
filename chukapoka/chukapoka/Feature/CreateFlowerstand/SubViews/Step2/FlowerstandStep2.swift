//
//  FlowerstandStep2.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerstandStep2: View {
    @ObservedObject var viewModel: CreateFlowerstandViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 39) {
            Text("진심을 담아\n나만의 화환 카드를 꾸며보세요!")
                .font(GSFont.title2)
                .foregroundColor(GSColor.black)
            
            VStack(spacing: 28) {
                VStack(spacing: 45) {
                    FlowerstandCardView(
                        selectedColor: viewModel.state.selectedColor,
                        selectedFlower: viewModel.state.selectedFlower
                    )
                    
                    CardDecorationPicker(
                        selectedColor: Binding(
                            get: { viewModel.state.selectedColor },
                            set: { viewModel.action(.selectColor($0)) }
                        ),
                        selectedFlower: Binding(
                            get: { viewModel.state.selectedFlower },
                            set: { viewModel.action(.selectFlower($0)) }
                        )
                    )
                }
                
                PrimaryButton(
                    title: "다음",
                    style: .basic,
                    action: {
                        viewModel.action(.tapNext)
                    }
                )
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    FlowerstandStep2(viewModel: CreateFlowerstandViewModel())
}
