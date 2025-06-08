//
//  OnboardingView.swift
//  chukapoka
//
//  Created by 김소원 on 6/5/25.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isOnboardingDone: Bool
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentPage) {
                ForEach(0..<2) { index in
                    if index == 0 {
                        NoticeStep1()
                    } else {
                        NoticeStep2()
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
                        .frame(width: 10, height: 10)
                        .animation(.easeInOut(duration: 0.2), value: currentPage)
                }
            }
            .padding(.bottom, 117)
            
            SkipView {
                withAnimation {
                    isOnboardingDone = true
                }
            }
           
        }
    }
}
