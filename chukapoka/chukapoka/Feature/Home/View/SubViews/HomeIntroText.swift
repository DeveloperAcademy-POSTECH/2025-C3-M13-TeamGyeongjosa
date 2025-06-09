//
//  HomeIntroText.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//
import SwiftUI

struct HomeIntroText: View {
    var body: some View {
        VStack {
            Text("지금 바로 마음을 전달해봐요")
                .multilineTextAlignment(.center)
                .font(GSFont.title2)
                .foregroundColor(GSColor.black)
            
            Text("처음이라 어렵다면 걱정마세요!\n추카포카의 포키가 도와줄게요")
                .multilineTextAlignment(.center)
                .font(GSFont.caption2)
                .lineSpacing(10)
                .foregroundColor(GSColor.black)
                .padding(.top, 36)
        }
    }
}
