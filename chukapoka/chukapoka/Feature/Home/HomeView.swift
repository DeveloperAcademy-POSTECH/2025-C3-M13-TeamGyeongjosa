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
            HomeChracterImage()
                .padding(.top,57)
            HomeIntroText()
                .padding(.top, 57)
            Spacer()
            HomeBottomButtons(
                onGroupCreateTapped: {
                    coordinator.push(.createGroup)
                },
                onGroupJoinTapped: {
                    coordinator.push(.joinGroup)
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
