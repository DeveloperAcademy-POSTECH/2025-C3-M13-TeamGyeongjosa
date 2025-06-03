//
//  InputPayment.swift
//  chukapoka
//
//  Created by 김소원 on 6/3/25.
//

import SwiftUI

struct InputPayment: View {
    var body: some View {
        VStack {
            Text("마지막으로 화환을 보내기 전 \n 축의금액 정보가 필요해요")
                .font(GSFont.title2)
                .lineSpacing(12)
                .padding()
                .foregroundStyle(GSColor.black)//balck 1 하면 왜 안됨?
            
    
        }
        .padding(.leading, 16)
    }
}

#Preview {
    InputPayment()
}
