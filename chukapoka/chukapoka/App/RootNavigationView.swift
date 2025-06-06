//
//  RootNaivationView.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct RootNavigationView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var selectImageViewModel : SelectImageViewModel = SelectImageViewModel()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HomeView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .home:
                        HomeView()
                    
                    // 그룹 생성 파티장 flow
                    case .createGroup(.infoStep1):
                        //InfoStep1View(viewModel: groupCreateViewModel)
                        SelectImageView(viewModel: selectImageViewModel)
                    
                    // 그룹 참여 파티원 flow
                    case .joinGroup(.enterCode):
                        EnterCodeView()
                        
                    }
                }
        }
        
    }
}
