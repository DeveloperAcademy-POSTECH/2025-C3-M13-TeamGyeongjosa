//
//  MemberCreateFlowerView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

struct MemberCreateFlowerView: View {
    @ObservedObject var viewModel: MemberJoinViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 39) {
            Text("진심을 담아\n나만의 화환 카드를 꾸며보세요!")
                .font(GSFont.title2)
                .lineSpacing(12)
                .foregroundColor(GSColor.black)
            
            VStack(spacing: 32) {
                FlowerstandCardView(
                    selectedColor: viewModel.state.selectedColor,
                    selectedFlower: viewModel.state.selectedFlower
                )
                
                CardDecorationPicker(
                    selectedColor: viewModel.bindingSelectedColor,
                    selectedFlower: viewModel.bindingSelectedFlower
                )
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding(.horizontal, 16)
    }
}
