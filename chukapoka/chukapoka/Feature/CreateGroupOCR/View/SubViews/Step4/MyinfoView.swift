//
//  MyinfoView.swift
//  chukapoka
//
//  Created by jenki on 6/11/25.
//

import SwiftUI

struct MyinfoView: View {
    @Binding var currentStep: InvitationOCRView.OCRStep
    @Environment(\.modelContext) var modelContext
    @ObservedObject var viewModel: CreateGroupViewModel

    var onBack: () -> Void
    
    var body: some View {
        NavigationBar {
          onBack()
        }
        CustomProgressView(progress: 0.9).padding(.bottom, 30)
        
        VStack(alignment: .leading, spacing: 4) {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        VStack(alignment: .leading, spacing: 4) {
                            (
                                Text("화환을") +
                                Text(" 보내는 분")
                                    .foregroundStyle(GSColor.primary) +
                                Text("의\n정보를 수집할게요")
                            )
                            
                            .font(GSFont.title2)
                            .lineSpacing(12)
                            .foregroundStyle(GSColor.black)
                            Text("결혼식 전날까지 돈을 안전하게 보관하기 위함이에요")
                                .font(GSFont.caption2)
                                .foregroundStyle(GSColor.gray2)
                        }
                        CustomTextField(
                            title: "모임명",
                            placeholder: "어떤 모임에서 화환을 전달하나요?",
                            text: $viewModel.partyName,
                            isValid: $viewModel.isPartyNameValid,
                            errorMessage: "모임명은 한글 10자 이내로 입력해주세요"
                        )
                        
                        CustomTextField(
                            title: "보내는 분",
                            placeholder: "ex) 김포키",
                            text: $viewModel.senderName,
                            isValid: $viewModel.isSenderNameValid,
                            errorMessage: "보내는 분은 한글 10자 이내로 입력해주세요"
                        )
                        CustomTextField(
                            title: "은행",
                            placeholder: "화환을 보내는 분의 은행을 입력해주세요",
                            text: $viewModel.senderBank,
                            isValid: $viewModel.isSenderBankValid,
                            errorMessage: "은행명은 한글 10자 이내로 입력해주세요"
                        )
                        CustomTextField(
                            title: "계좌번호",
                            placeholder: "화환을 보내는 분의 계좌번호를 입력해주세요",
                            text: $viewModel.senderAccount,
                            isValid: $viewModel.isSenderAccountValid,
                            errorMessage: "계좌번호는 11자 ~ 14자 이내로 입력해주세요"
                        )
                        .keyboardType(.numberPad)
                        CustomTextField(
                            title: "연락처",
                            placeholder: "010-1234-5678",
                            text: $viewModel.senderPhoneNumber,
                            isValid: $viewModel.isSenderPhoneNumberValid,
                            errorMessage: "연락처는 11자 이내로 입력해주세요"
                        )
                        .keyboardType(.numberPad)
                        .onChange(of: viewModel.senderPhoneNumber) {
                            viewModel.senderPhoneNumber = viewModel.formatPhoneNumberInput(viewModel.senderPhoneNumber)
                        }
                        Text("파티가 해산되면 입력하신 정보로 돌려드려요")
                            .font(GSFont.caption2)
                            .foregroundColor(GSColor.black)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 16)
            .animation(.easeInOut, value: viewModel.currentStep)
            
            PrimaryButton(
                title: viewModel.nextButtonTitle,
                style: viewModel.isNextButtonEnabled ? .basic : .disabled,
                action: {
                    viewModel.handleNext(modelContext: modelContext)
                    viewModel.currentStep = .step3
                }
            )
            .padding(.horizontal, 16)
            .padding(.bottom, 30)
        }
        .navigationBarBackButtonHidden(true)
        .onTapGesture {
            self.endTextEditing()
        }
    }
}
