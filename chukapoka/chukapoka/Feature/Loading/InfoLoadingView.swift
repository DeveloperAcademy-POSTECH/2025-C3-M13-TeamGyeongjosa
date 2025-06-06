//
//  Loading.swift
//  chukapoka
//
//  Created by 김소원 on 6/3/25.
//

import SwiftUI

struct InfoLoadingView: View {
    var body: some View {
        VStack(spacing: 0) {
            
            Rectangle()
                .foregroundStyle(GSColor.primary)
                .frame(height: 2)
                .padding(.top, 48)
            
            Text("모든 준비가 끝났어요! \n 열심히 재료를 배달 중이에요")
                .foregroundStyle(GSColor.black)
                .font(GSFont.title2)
                .multilineTextAlignment(.center)
                .lineSpacing(12) // 36 - 24
                .padding(.top, 58)
            
            Image("DeliveryDog")
                .resizable()
                .scaledToFit()
                .frame(width: 330)
                .padding(.top, 138)
            
            Spacer()
        }
    }
}

#Preview {
    InfoLoadingView()
}
