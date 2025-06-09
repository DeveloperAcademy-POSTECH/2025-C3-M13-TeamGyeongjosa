//
//  EnterBaseView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

struct EnterGroupView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel: EnterGroupViewModel
    
    init(viewModel: EnterGroupViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar {
                viewModel.goBack()
            }
            
            ZStack {
                switch viewModel.step {
                case .inputCode:
                    InputCodeView(viewModel: viewModel)
                case .nameCheck:
                    NameCheckView(viewModel: viewModel)
                }
            }
            .padding(.horizontal, 16)
            .animation(.easeInOut, value: viewModel.step)
            
            // ✅ 하단 버튼 고정
            PrimaryButton(
                title: viewModel.step == .nameCheck ? "확인" : "다음",
                style: (viewModel.step == .nameCheck || viewModel.code.count == 6)
                ? .basic
                : .disabled,
                action: {
                    switch viewModel.step {
                    case .inputCode:
                        viewModel.validateAndFetchParty(modelContext: modelContext)
                    case .nameCheck:
                        viewModel.goNext()
                    }
                }
            )
            .padding(.horizontal, 16)
            .padding(.bottom, 30)
        }
        .navigationBarBackButtonHidden(true)
    }
}
