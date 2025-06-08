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
    @Query(sort: \Party.partyID, order: .reverse) var parties: [Party]

    var body: some View {
        VStack(spacing: 0) {
            if parties.isEmpty {
                HomeNormalView()
            } else {
                HomeCardView(parties: parties)
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
