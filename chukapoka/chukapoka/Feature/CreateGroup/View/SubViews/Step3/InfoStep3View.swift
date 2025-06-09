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
                Text("화환을 보내는 분의 정보를 수집할게요")
                    .font(GSFont.title2)
                
                CustomTextField(
                    title: "보내는 분",
                    placeholder: "ex) 김포키",
                    text: $viewModel.senderName,
                    isValid: $viewModel.isSenderNameValid
                )
                
                CustomTextField(
                    title: "은행",
                    placeholder: "ex) 카카오뱅크",
                    text: $viewModel.senderBank,
                    isValid: $viewModel.isSenderBankValid
                )
                
                CustomTextField(
                    title: "계좌번호",
                    placeholder: "계좌번호 입력",
                    text: $viewModel.senderAccount,
                    isValid: $viewModel.isSenderAccountValid
                )
                .keyboardType(.numberPad)
                
                CustomTextField(
                    title: "연락처",
                    placeholder: "010-1234-5678",
                    text: $viewModel.senderPhoneNumber,
                    isValid: $viewModel.isSenderPhoneNumberValid
                )
                .keyboardType(.numberPad)
                .onChange(of: viewModel.senderPhoneNumber) {
                    viewModel.senderPhoneNumber = viewModel.formatPhoneNumberInput(viewModel.senderPhoneNumber)
                }
                
                Text("파티 해산 시 해당 정보로 돌려드려요")
                    .font(GSFont.caption2)
                    .foregroundColor(GSColor.black)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
        }
    }
}
