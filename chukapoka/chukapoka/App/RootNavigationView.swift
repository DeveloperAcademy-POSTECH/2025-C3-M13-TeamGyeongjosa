//
//  RootNaivationView.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI
import SwiftData

struct RootNavigationView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HomeView()
                .navigationBarHidden(true)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .home:
                        HomeView()
                            .navigationBarHidden(true)
                        // 그룹 생성 파티장 flow
                    case .createGroup:
                        CreateGroupView(viewModel: CreateGroupViewModel(coordinator: coordinator))
                            .navigationBarHidden(true)
                    case .createFlowerstand(let leader):
                        CreateFlowerstandView(viewModel: CreateFlowerstandViewModel(coordinator: coordinator, leader: leader))
                            .navigationBarHidden(true)
                    case .loadingInfoDone(let leader):
                        InfoLoadingView(viewModel: InfoViewModel(coordinator: coordinator, leader: leader))
                            .navigationBarHidden(true)
                    case .joinGroup:
                        EnterCodeView()
                            .navigationBarHidden(true)
                    case .loadingFlowerstandDone:
                        FlowerLoadingView(viewModel: FlowerLoadingViewModel(coordinator: coordinator))
                            .navigationBarHidden(true)
                    }
                }
        }
        
    }
}
