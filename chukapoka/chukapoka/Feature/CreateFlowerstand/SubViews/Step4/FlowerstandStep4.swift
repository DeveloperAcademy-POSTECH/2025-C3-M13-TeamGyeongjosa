//
//  FlowerstandStep4.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerstandStep4: View {
    @ObservedObject var viewModel: CreateFlowerstandViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 155) {
            Text("\(viewModel.state.recipientName)님 만의\n화환이 준비되었어요!")
                .font(GSFont.title2)
                .foregroundColor(GSColor.black)
                .multilineTextAlignment(.center)
            
            PrimaryButton(
                title: "카드 보내기",
                style: .basic,
                action: {
                    // 액션 필요 시 여기에 작성
                }
            )
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    FlowerstandStep4(viewModel: CreateFlowerstandViewModel())
}
