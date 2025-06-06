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
        VStack(spacing: 0) {
            Spacer()
            HomeIntroText()
                .padding(.bottom, 96)
            HomeChracterImage()
            Spacer()
            HomeBottomButtons(
                onGroupCreateTapped: {
                    coordinator.push(.createGroupInfoStep1)
                },
                onGroupJoinTapped: {
                    coordinator.push(.joinGroup(.enterCode))
                }
            )
            .padding(.bottom, 24)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AppCoordinator())
}
