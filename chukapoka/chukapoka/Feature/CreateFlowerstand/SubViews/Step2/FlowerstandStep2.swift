//
//  FlowerstandStep2.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerstandStep2: View {
    @ObservedObject var viewModel: FlowerStandStep2ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 39) {
            Text("진심을 담아\n나만의 화환 카드를 꾸며보세요!")
                .font(GSFont.title2)
                .foregroundColor(GSColor.black)
            
            VStack(spacing: 28) {
                VStack(spacing: 45) {
                    FlowerstandCardView(
                        selectedColor: viewModel.selectedColor,
                        selectedFlower: viewModel.selectedFlower
                    )
                    
                    CardDecorationPicker(
                        selectedColor: $viewModel.selectedColor,
                        selectedFlower: $viewModel.selectedFlower
                    )
                }
            }
        }
        .padding(.horizontal, 16)
    }
}
