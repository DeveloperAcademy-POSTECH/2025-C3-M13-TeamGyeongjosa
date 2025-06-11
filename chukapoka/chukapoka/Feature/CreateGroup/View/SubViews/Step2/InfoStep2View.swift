//
//  InfoStep2View.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct InfoStep2View: View {
    @ObservedObject var viewModel: CreateGroupViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                Text("화환을 받는 분의\n정보를 수집할게요")
                    .font(GSFont.title2)
                
                CustomTextField(
                    title: "받는 분",
                    placeholder: "ex) 김신부",
                    text: $viewModel.receiverName,
                    isValid: $viewModel.isReceiverNameValid,
                    errorMessage: "받는 분은 한글 10자 이내로 입력해주세요"
                )
                
                CustomTextField(
                    title: "은행명",
                    placeholder: "모바일 청첩장에 있는 은행명을 알려주세요",
                    text: $viewModel.receiverBank,
                    isValid: $viewModel.isReceiverBankValid,
                    errorMessage: "은행명은 한글 10자 이내로 입력해주세요"
                )
                
                CustomTextField(
                    title: "계좌번호",
                    placeholder: "모바일 청첩장에 있는 계좌번호를 알려주세요",
                    text: $viewModel.receiverAccount,
                    isValid: $viewModel.isReceiverAccountValid,
                    errorMessage: "계좌번호는 11자 ~ 14자 이내로 입력해주세요"
                )
                .keyboardType(.numberPad)
                
                Spacer()
            }
        }
    }
}
