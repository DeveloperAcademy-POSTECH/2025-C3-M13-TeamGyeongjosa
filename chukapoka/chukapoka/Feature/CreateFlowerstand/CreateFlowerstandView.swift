//
//  CreateFlowerstandView.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct CreateFlowerstandView: View {
    @ObservedObject var viewModel: CreateFlowerstandViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // ⬆︎ 상단: 프로그레스 바만
            CircleProgress(step: viewModel.step.rawValue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .padding(.horizontal, 16)
            
            // 플로우따라 바뀌는 컨테이너
            ZStack {
                switch viewModel.step {
                case .amount:
                    FlowerstandStep1(viewModel: viewModel.moneyinputVM)
                default:
                    EmptyView()
                }
            }
            .frame(maxHeight: .infinity)
            
            // 하단 버튼 고정
            PrimaryButton(
                title: "다음",
                style: viewModel.isNextEnabled ? .basic : .disabled,
                action: {
                    viewModel.goNext()
                }
            )
            .padding(.horizontal, 16)
            .padding(.bottom, 31)
        }
        .ignoresSafeArea(.keyboard)
    }
}
#Preview {
    CreateFlowerstandView(viewModel: CreateFlowerstandViewModel())
}
