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
                Text("화환을 받는 분의 정보를 수집할게요")
                    .font(GSFont.title2)
                
                CustomTextField(
                    title: "받는 분",
                    placeholder: "ex) 김신부",
                    text: $viewModel.receiverName,
                    isValid: $viewModel.isReceiverNameValid
                )
                
                CustomTextField(
                    title: "은행",
                    placeholder: "ex) 카카오뱅크",
                    text: $viewModel.receiverBank,
                    isValid: $viewModel.isReceiverBankValid
                )
                
                CustomTextField(
                    title: "계좌번호",
                    placeholder: "계좌번호 입력",
                    text: $viewModel.receiverAccount,
                    isValid: $viewModel.isReceiverAccountValid
                )
                .keyboardType(.numberPad)
                
                Spacer()
            }
        }
    }
}
