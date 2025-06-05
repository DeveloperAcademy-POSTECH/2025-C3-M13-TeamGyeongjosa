//
//  FlowerstandStep1.swift
//  chukapoka
//
//  Created by 조유진 on 6/4/25.
//

import SwiftUI

struct FlowerstandStep1: View {
    @State private var amountText: String = ""
    
    var amount: Int? {
        Int(amountText)
    }
    
    var isValidAmount: Bool {
        if let amount = amount, amount > 0 {
            return true
        }
        return false
    }
    
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
                if amountText.isEmpty {
                    Text("얼마를 보낼까요?")
                        .font(GSFont.title2)
                        .foregroundStyle(GSColor.gray1)
                } else if let amount = amount {
                    Text("\(amount)만원")
                        .font(GSFont.title2)
                        .foregroundStyle(GSColor.primary)
                }
                
                TextField("", text: $amountText)
                    .keyboardType(.numberPad)
                    .foregroundColor(.clear)
                    .accentColor(.clear)
                    .disableAutocorrection(true)
                    .onChange(of: amountText) {
                        amountText = String(amountText.filter { $0.isNumber }.prefix(3))
                    }
            }
            .padding(.horizontal, 4)
            .padding(.top, 32)
            
            Spacer()
            
            VStack {
                Text("우리은행 1002-246-194483 김현진")
                    .font(GSFont.caption2)
                    .foregroundStyle(GSColor.primary)
                    .padding(.bottom, 16)
                
                PrimaryButton(
                    title: "다음",
                    style: isValidAmount ? .basic : .disabled,
                    action: { print("다음 클릭: \(amount ?? 0)만원") }
                )
            }
        }
        .padding(.horizontal, 16)
    }
}
