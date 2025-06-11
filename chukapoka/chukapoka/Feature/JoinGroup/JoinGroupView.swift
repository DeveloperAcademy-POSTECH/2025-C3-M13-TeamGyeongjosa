//
//  JoinGroupView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI
import SwiftData

struct JoinGroupView: View {
    @StateObject var viewModel: MemberJoinViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack(spacing: 0) {
            if viewModel.step != .info {
                NavigationBar {
                    viewModel.send(.goBack)
                }
            } else {
                Color.clear
                    .frame(height: 100)
            }
            
            if viewModel.step != .showResult && viewModel.step != .info {
                CircleProgress(step: max(viewModel.step.rawValue - 1, 0))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 16)
            }
            
            ZStack {
                switch viewModel.step {
                case .info:
                    MemberInfoView(viewModel: viewModel)
                case .money:
                    MemberMoneyView(viewModel: viewModel)
                case .decorate:
                    MemberCreateFlowerView(viewModel: viewModel)
                case .message:
                    MemberCreateMessageView(viewModel: viewModel)
                case .showResult:
                    MemberShowFlowerView(viewModel: viewModel)
                }
            }
            .frame(maxHeight: .infinity)
            
            PrimaryButton(
                title: viewModel.nextButtonTitle,
                style: viewModel.isNextEnabled ? .basic : .disabled,
                action: {
                    if viewModel.step == .showResult {
                        viewModel.send(.save, modelContext: modelContext)
                        coordinator.push(.loadingJoinGroupDone)
                    } else {
                        viewModel.send(.goNext)
                    }
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
