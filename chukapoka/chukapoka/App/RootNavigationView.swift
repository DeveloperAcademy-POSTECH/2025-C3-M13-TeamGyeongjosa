//
//  RootNaivationView.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct RootNavigationView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var groupCreateViewModel: CreateGroupViewModel
    @StateObject private var ocrViewModel : OCRViewModel = OCRViewModel()

    init(coordinator: AppCoordinator) {
        // init에서는 coordinator를 못 씀 → StateObject를 지연 초기화 방식으로
        _groupCreateViewModel = StateObject(wrappedValue: CreateGroupViewModel(coordinator: coordinator))
    }

    
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
                    case .createGroupInfoStep1:
                        InfoStep1View(viewModel: groupCreateViewModel)
                            .navigationBarHidden(true)
                        //OCRScreen(viewModel: ocrViewModel)
                    
                    // 그룹 참여 파티원 flow
                    case .joinGroup(.enterCode):
                        EnterCodeView()
                            .navigationBarHidden(true)
                        
                        // 꽃 만들기 flow
                    case .createFlowerstand:
                        CreateFlowerstandView(viewModel: CreateFlowerstandViewModel())
                            .navigationBarHidden(true)
                    
                    case .loadingInfoDone:
                        FlowerLoadingView()
                            .navigationBarHidden(true)
                        
                    default:
                        EmptyView()
                            .navigationBarHidden(true)
                        
                    }
                }
        }
        
    }
}
