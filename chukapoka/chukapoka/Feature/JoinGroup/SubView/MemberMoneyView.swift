//
//  MemberMoneyView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//
import SwiftUI

struct MemberMoneyView: View {
    @ObservedObject var viewModel: MemberJoinViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 4) {
                Text("나만의 화환 카드를 만드려면\n축의금액 정보가 필요해요")
                    .font(GSFont.title2)
                    .lineSpacing(12)
                    .foregroundStyle(GSColor.black)
                
                Text("축의금액 선택 후 아래의 계좌로 축의금을 보내주세요")
                    .font(GSFont.caption2)
                    .foregroundStyle(GSColor.gray2)
            }
            
            ZStack(alignment: .leading) {
                if viewModel.state.amountText.isEmpty {
                    Text("얼마를 보낼까요?")
                        .font(GSFont.title2)
                        .foregroundStyle(GSColor.gray1)
                } else if let amount = viewModel.amount {
                    Text("\(amount)만원")
                        .font(GSFont.title2)
                        .foregroundStyle(GSColor.primary)
                }
                
                TextField("", text: viewModel.bindingAmountText)
                    .keyboardType(.numberPad)
                    .foregroundColor(.clear)
                    .accentColor(.clear)
                    .disableAutocorrection(true)
                    .background(Color.white.opacity(0.01))
            }
            .padding(.horizontal, 4)
            .padding(.top, 32)
            
            Spacer()
            
            HStack {
                Spacer()
                Text("우리은행 1002-246-194483 추카포카")
                    .font(GSFont.caption2)
                    .foregroundStyle(GSColor.primary)
                    .padding(.bottom, 16)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .onTapGesture {
            self.endTextEditing()
        }
    }
}
