//
//  Untitled.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

struct MemberInfoView: View {
    
    @ObservedObject var viewModel: MemberJoinViewModel
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {
                    (
                        Text("화환을 ") +
                        Text("보내는 분")
                            .foregroundStyle(GSColor.primary) +
                        Text("의\n정보를 수집할게요")
                    )
                    .lineSpacing(12)
                    .font(GSFont.title2)
                    
                    CustomTextField(
                        title: "보내는 분",
                        placeholder: "ex) 김포키",
                        text: viewModel.bindingSenderName,
                        isValid: viewModel.bindingIsSenderNameValid,
                        errorMessage: "보내는 분은 한글 10자 이내로 입력해주세요"
                    )
                    
                    CustomTextField(
                        title: "은행명",
                        placeholder: "화환을 보내는 분의 은행을 입력해주세요",
                        text: viewModel.bindingSenderBankName,
                        isValid: viewModel.bindingIsSenderBankNameValid,
                        errorMessage: "은행명은 한글 10자 이내로 입력해주세요"
                    )
                    
                    CustomTextField(
                        title: "계좌번호",
                        placeholder: "화환을 보내는 분의 계좌번호를 입력해주세요",
                        text: viewModel.bindingSenderAccountNumber,
                        isValid: viewModel.bindingIsSenderAccountNumberValid,
                        errorMessage: "계좌번호는 11자 ~ 14자 이내로 입력해주세요"
                    )
                    .keyboardType(.numberPad)
                    
                    CustomTextField(
                        title: "연락처",
                        placeholder: "010-1234-5678",
                        text: viewModel.bindingSenderPhone,
                        action: {
                            viewModel.send(.updatePhone(viewModel.state.phoneNumber))
                        },
                        isValid: viewModel.bindingIsSenderPhoneValid,
                        errorMessage: "연락처는 11자 이내로 입력해주세요"
                    )
                    .keyboardType(.numberPad)
                    
                    Text("파티 해산 시 해당 정보로 돌려드려요")
                        .font(GSFont.caption2)
                        .foregroundColor(GSColor.black)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 16)
    }
}
