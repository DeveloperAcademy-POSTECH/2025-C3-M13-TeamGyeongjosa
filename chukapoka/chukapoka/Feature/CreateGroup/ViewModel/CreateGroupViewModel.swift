//
//  GroupCreateViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//
import Foundation
import SwiftUI

@MainActor
final class CreateGroupViewModel: ObservableObject {
    let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    // View가 처리
    func didTapNext() {
        self.coordinator.push(.createFlowerstand)
    }
}
