//
//  RootNaivationView.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

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
                        // CreateGroupView(viewModel: CreateGroupViewModel(coordinator: coordinator))
                        ImagePickerView(viewModel: OCRViewModel(coordinator: coordinator))
                            .navigationBarHidden(true)
                    case .createFlowerstand:
                        CreateFlowerstandView(viewModel: CreateFlowerstandViewModel(coordinator: coordinator))
                            .navigationBarHidden(true)
                    case .loadingInfoDone:
                        InfoLoadingView(viewModel: InfoViewModel(coordinator: coordinator))
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
