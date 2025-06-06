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
                    placeholder: "예: 김영희",
                    text: $viewModel.senderName,
                    isValid: $viewModel.isSenderNameValid
                )
                
                CustomTextField(
                    title: "계좌번호",
                    placeholder: "입금 계좌번호",
                    text: $viewModel.senderAccount,
                    isValid: $viewModel.isSenderAccountValid
                )
                .keyboardType(.numberPad)
                
                CustomTextField(
                    title: "연락처",
                    placeholder: "010-1234-5678",
                    text: $viewModel.senderPhone,
                    isValid: $viewModel.isSenderPhoneValid
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
}
