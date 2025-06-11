//
//  InfoStep1View.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct InfoStep3View: View {
    @ObservedObject var viewModel: CreateGroupViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                Text("화환을 보내는 분의\n정보를 수집할게요")
                    .font(GSFont.title2)
                
                CustomTextField(
                    title: "보내는 분",
                    placeholder: "ex) 김포키",
                    text: $viewModel.senderName,
                    isValid: $viewModel.isSenderNameValid,
                    errorMessage: "보내는 분은 한글 10자 이내로 입력해주세요"
                )
                
                CustomTextField(
                    title: "은행명",
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
}
