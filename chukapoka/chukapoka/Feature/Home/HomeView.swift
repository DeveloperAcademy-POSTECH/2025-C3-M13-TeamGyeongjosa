//
//  HomeView.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    // 최근에 만들어진 것
    @Query(sort: \Party.createdAt, order: .reverse) var parties: [Party]
    @State private var currentIndex = 0

    var body: some View {
        VStack(spacing: 0) {
            if parties.isEmpty {
                HomeNormalView()
            } else {
                HomeCardView(parties: parties, currentIndex: $currentIndex)
            }
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
