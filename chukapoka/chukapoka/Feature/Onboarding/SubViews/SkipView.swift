//
//  SkipView.swift
//  chukapoka
//
//  Created by 김소원 on 6/6/25.
//
import SwiftUI

struct SkipView: View {
    let onSkip: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    onSkip()  // ✅ 스킵 눌렀을 때 호출
                }) {
                    HStack(spacing: 4) {
                        Text("Skip")
                            .font(GSFont.caption2)
                            .foregroundStyle(GSColor.primary)
                            .font(.custom("Pretendard-Medium", size: 20))
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(GSColor.primary)
                            .font(.system(size: 16, weight: .medium))
                    }
                }
                .padding(.leading, 36)
                .padding(.bottom, 32)
                
                Spacer()
            }
        }
    }
}
