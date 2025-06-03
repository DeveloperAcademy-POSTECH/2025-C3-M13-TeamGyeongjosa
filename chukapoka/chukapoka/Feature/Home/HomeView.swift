//
//  HomeView.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        mainContent()
    }
    
    // MARK: - Main View
    @ViewBuilder
    private func mainContent() -> some View {
        VStack(spacing: 0) {
            Spacer()
            introSection()
            Spacer()
            actionSection()
                .padding(.bottom, 58)
        }
    }
    
    // MARK: - 상단 소개 문구 + 이미지
    @ViewBuilder
    private func introSection() -> some View {
        VStack(spacing: 96) {
            introText
            pokiImage
        }
    }
    
    private var introText: some View {
        Text("멤버를 초대하고\n함께 축하해보세요")
            .multilineTextAlignment(.center)
            .font(GSFont.title2)
            .foregroundColor(GSColor.black)
    }
    
    private var pokiImage: some View {
        GSImage.mainLogo
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 214, height: 214)
    }
    
    // MARK: - 하단 버튼 섹션
    @ViewBuilder
    private func actionSection() -> some View {
        PairButton(
            leftTitle: "그룹 생성하기",
            rightTitle: "코드로 참여하기",
            leftStyle: .custom(
                textColor: GSColor.primary,
                backgroundColor: GSColor.secondary3,
                isEnable: true),
            rightStyle: .custom(
                textColor: GSColor.white,
                backgroundColor: GSColor.primary,
                isEnable: true),
            leftAction: {
                coordinator.push(.groupCreate(.infoStep1))
            },
            rightAction: {
                    coordinator.push(.groupJoin(.enterCode))
            }
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    HomeView()
}
