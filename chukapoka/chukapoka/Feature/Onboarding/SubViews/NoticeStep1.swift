//
//  NoticeStep1.swift
//  chukapoka
//
//  Created by 김소원 on 6/5/25.
//

import SwiftUI
import Lottie

struct NoticeStep1: View {
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                Spacer()
                LottieView(fileName: "CKPK_onboarding1")
                                .frame(width: 320, height: 320)
                                .padding(.bottom, 40)
                
                Text("함께 축하할 사람을 모아봐요")
                    .foregroundStyle(GSColor.black)
                    .font(GSFont.title2)
                    .multilineTextAlignment(.center)
                    .lineSpacing(12)
                    .padding(.bottom, 36)
                
                Text("파티장이 되어 축하할 사람을 모을 수도 있고\n이미 생성된 파티에 참여해 축하할 수도 있어요")
                    .foregroundStyle(GSColor.gray2)
                    .font(GSFont.caption2)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .padding(.bottom, 36)
                
            }
            .tag(0)
        }
    }
}

#Preview {
    NoticeStep1()
}
