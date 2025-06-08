//
//  CreateFlowerstandView.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct CreateFlowerstandView: View {
    @ObservedObject var viewModel: CreateFlowerstandViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar {
                viewModel.goBack()
            }
            // ⬆︎ 상단: 프로그레스 바만
            if viewModel.step != .complete {
                CircleProgress(step: viewModel.step.rawValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 16)
            }
            
            // 플로우따라 바뀌는 컨테이너
            ZStack {
                switch viewModel.step {
                case .amount:
                    FlowerstandStep1(viewModel: viewModel.step1ViewModel)
                case .decorate:
                    FlowerstandStep2(viewModel: viewModel.step2ViewModel)
                case . message:
                    FlowerstandStep3(viewModel: viewModel.step3ViewModel)
                case .complete:
                    FlowerstandStep4(viewModel: viewModel)
                }
            }
            .frame(maxHeight: .infinity)
            
            // 하단 버튼 고정
            PrimaryButton(
                title: viewModel.nextButtonTitle,
                style: viewModel.isNextEnabled ? .basic : .disabled,
                action: {
                    viewModel.goNext(modelContext: modelContext)
                }
            )
            .padding(.horizontal, 16)
            .padding(.bottom, 31)
        }
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            self.endTextEditing()
        }
    }
}
