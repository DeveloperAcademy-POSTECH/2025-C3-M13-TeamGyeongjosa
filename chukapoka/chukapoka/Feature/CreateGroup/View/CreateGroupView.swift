//
//  CreateGroupView.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct CreateGroupView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: CreateGroupViewModel
    
    // 초기화
    init(viewModel: CreateGroupViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - 툴바 (뒤로가기)
            NavigationBar {
                viewModel.goToPreviousStep()
            }
            
            // MARK: - ZStack으로 Step 전환
            ZStack {
                switch viewModel.currentStep {
                case .step1:
                    InfoStep1View(viewModel: viewModel)
                case .step2:
                    InfoStep2View(viewModel: viewModel)
                case .step3:
                    InfoStep3View(viewModel: viewModel)
                }
            }
            .padding(.horizontal, 16)
            .animation(.easeInOut, value: viewModel.currentStep)
            
            // MARK: - 하단 진행도 + 다음 버튼
            VStack(spacing: 12) {
                CustomProgressView(progress: viewModel.progressRate)
                
                PrimaryButton(
                    title: viewModel.nextButtonTitle,
                    style: .custom(
                        textColor: GSColor.white,
                        backgroundColor: GSColor.primary,
                        isEnable: true
                    ),
                    action: {
                        viewModel.handleNext()
                    }
                )
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 30)
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            self.endTextEditing()
        }
    }
}
