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
        VStack(alignment: .leading, spacing: 32) {
            Text("화환을 받는 분의 정보를 수집할게요")
                .font(GSFont.title2)
            
            CustomTextField(
                title: "받는 분",
                placeholder: "예: 홍길동",
                text: $viewModel.receiverName,
                isValid: $viewModel.isReceiverNameValid
            )
            
            CustomTextField(
                title: "계좌번호",
                placeholder: "은행 및 계좌번호 입력",
                text: $viewModel.receiverAccount,
                isValid: $viewModel.isReceiverAccountValid
            )
            .keyboardType(.numberPad)
            
            Spacer()
        }
    }
}
