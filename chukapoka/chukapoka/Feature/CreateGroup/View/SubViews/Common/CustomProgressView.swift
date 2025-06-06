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
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // 배경 바
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 1)
                
                // 진행 바
                Rectangle()
                    .fill(GSColor.primary)
                    .frame(width: geometry.size.width * progress, height: 2)
            }
        }
        .frame(height: 2) // 외부에서 height 강제
    }
}
