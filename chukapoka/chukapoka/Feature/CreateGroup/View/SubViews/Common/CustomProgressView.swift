//
//  CustomProgressView.swift
//  chukapoka
//
//  Created by MacBook Air on 6/5/25.
//

import SwiftUI

struct CustomProgressView: View {
    var progress: CGFloat // 0.0 ~ 1.0

    var body: some View {
        ZStack(alignment: .leading) {
            // 배경: 완전한 흰색
            Rectangle()
                .fill(Color.white)
                .frame(height: 1)

            // 진행 바: 둥글지 않은 스타일
            Rectangle()
                .fill(GSColor.primary)
                .frame(width: UIScreen.main.bounds.width * progress - 0, height: 2) // 16pt 좌우 패딩 고려
        }
    }
}

#Preview {
  CustomProgressView(progress: 0.5)
}
