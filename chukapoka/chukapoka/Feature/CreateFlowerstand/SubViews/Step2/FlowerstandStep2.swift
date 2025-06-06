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
        VStack(spacing: 39) {
            HStack {
                Text("진심을 담아\n나만의 화환 카드를 꾸며보세요!")
                    .font(GSFont.title2)
                    .foregroundColor(GSColor.black)
                Spacer()
            }
            
            VStack(spacing: 45) {
                FlowerstandCardView(
                    selectedColor: viewModel.selectedColor,
                    selectedFlower: viewModel.selectedFlower
                )
                
                CardDecorationPicker(
                    selectedColor: $viewModel.selectedColor,
                    selectedFlower: $viewModel.selectedFlower
                )
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding(.horizontal, 16)
    }
}
