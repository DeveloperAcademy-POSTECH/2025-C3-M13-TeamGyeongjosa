//
//  OnboardingView.swift
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
                    if index == 0 {
                        VStack(spacing: 0) {
                            Spacer()
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
                    } else {
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
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack(spacing: 8) {
                ForEach(0..<2) { index in
                    Circle()
                        .fill(index == currentPage ? GSColor.primary : Color.clear)
                        .overlay(
                            Circle()
                                .stroke(GSColor.primary, lineWidth: 2)
                        )
                        .frame(width: 12, height: 12)
                        .animation(.easeInOut(duration: 0.2), value: currentPage)
                }
            }
            .padding(.bottom, 155)
        }
    }
}

#Preview {
    OnboardingView()
}
