//
//  NoticeStep2.swift
//  chukapoka
//
//  Created by 김소원 on 6/5/25.
//

import SwiftUI

struct NoticeStep2: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("나만의 화환 포토카드로 축하해줘요")
                .foregroundStyle(GSColor.black)
                .font(GSFont.title2)
                .multilineTextAlignment(.center)
                .lineSpacing(12)
                .padding(.bottom, 36)
            
            Text("축의금과 함께 하고 싶은 말을 화환 카드에 담아 전달해요\n신랑 신부에게는 모임 단위로 카드가 보여져요")
                .foregroundStyle(GSColor.gray2)
                .font(GSFont.caption2)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .padding(.bottom, 36)
            
        }
        .tag(1)
    }
}

#Preview {
    NoticeStep2()
}
