//
//  MemberLoadingViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

@MainActor
final class MemberLoadingViewModel: ObservableObject {
    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        startLoading()
    }
    
    private func startLoading() {
        Task {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            coordinator.popToRoot()
        }
    }
}
