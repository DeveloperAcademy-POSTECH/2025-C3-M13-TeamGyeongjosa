//
//  Onboarding.swift
//  chukapoka
//
//  Created by 김소원 on 6/5/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentPage) {
                ForEach(0..<2) { index in
                    VStack(spacing: 0) {
                        Spacer()
                        
                        Text("함께 축하할 사람을 모아봐요")
                            .foregroundStyle(GSColor.black)
                            .font(GSFont.title2)
                            .multilineTextAlignment(.center)
                            .lineSpacing(12) // 36 - 24
                            .padding(.bottom, 36)

                        Text("파티장이 되어 축하할 사람을 모을 수도 있고\n이미 생성된 파티에 참여해 축하할 수도 있어요")
                            .foregroundStyle(GSColor.gray2)
                            .font(GSFont.caption2)
                            .multilineTextAlignment(.center)
                            .lineSpacing(10) // 24 -14
                        
                        Spacer()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // 기본 인디케이터 숨김
            
            HStack(spacing: 8) { // 커스텀 인디케이터는 일단 대강 해둠
                ForEach(0..<2) { index in
                    Circle()
                        .fill(index == currentPage ? GSColor.primary : Color.clear)
                        .overlay(
                            Circle()
                                .stroke(GSColor.primary, lineWidth: 1)
                        )
                        .frame(width: 10, height: 10)
                        .animation(.easeInOut(duration: 0.2), value: currentPage)
                }
            }
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    OnboardingView()
}

