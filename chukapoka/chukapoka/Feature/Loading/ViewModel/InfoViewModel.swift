//
//  InfoViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/7/25.
//

import SwiftUI

@MainActor
final class InfoViewModel: ObservableObject {
    private let coordinator: AppCoordinator
    private let leader: PartyMember
    
    init(coordinator: AppCoordinator, leader: PartyMember) {
        self.coordinator = coordinator
        self.leader = leader
        startLoading()
    }
    
    private func startLoading() {
        Task {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            coordinator.push(.createFlowerstand(leader: leader))
        }
    }
}
