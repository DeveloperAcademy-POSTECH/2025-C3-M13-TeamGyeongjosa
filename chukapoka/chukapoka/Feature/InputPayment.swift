//
//  InputPayment.swift
//  chukapoka
//
//  Created by 김소원 on 6/3/25.
// 숫자 키패드만 올라오게 하기



import SwiftUI

struct InputPayment: View {
    @State private var amount: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Circle()
                    .fill(GSColor.primary)
                    .frame(width: 15, height: 15)
                
                Rectangle()
                    .fill(GSColor.primary)
                    .frame(width: 10, height: 2)
                
                Circle()
                    .stroke(GSColor.primary)
                    .frame(width: 15, height: 15)
                
                Rectangle()
                    .fill(GSColor.primary)
                    .frame(width: 10, height: 2)
                
                Circle()
                    .stroke(GSColor.primary, lineWidth: 1.5)
                    .frame(width: 15, height: 15)
            }
            .padding(.top, 16)
            
            Text("마지막으로 화환을 보내기 전 \n축의금액 정보가 필요해요")
                .font(GSFont.title2)
                .lineSpacing(12)
                .foregroundStyle(GSColor.black)
                .padding(.top, 20)
            
            Text("축의금액 선택 후 아래의 계좌로 축의금을 보내주세요")
                .font(GSFont.caption2)
                .foregroundStyle(GSColor.gray2)
                .frame(height: 36)
            // 이거 간격 어케함?
            
            
            ZStack(alignment: .leading) {
                if amount.isEmpty {
                    Text("얼마를 보낼까요?")
                        .font(GSFont.title2)
                        .foregroundStyle(GSColor.gray1)
                } else {
                    Text("\(amount)만원")
                        .font(GSFont.title2)
                        .foregroundStyle(GSColor.primary)
                }
                
                TextField("", text: $amount)
                    .keyboardType(.numberPad)
                    .foregroundColor(.clear)
                    .accentColor(.clear)
                    .disableAutocorrection(true)
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
                    style: amount.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    ? .disabled
                    : .basic,
                    action: { print("다음 클릭") }
                )
                .padding(.bottom, 30)
            }
            
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    InputPayment()
}
