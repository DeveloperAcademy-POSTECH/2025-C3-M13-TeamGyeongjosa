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
        VStack(spacing: 10) {
            Button("🎉 그룹 만들기") {
                coordinator.push(.groupCreate(.infoStep1))
            }

            Button("💌 코드 입력하기") {
                coordinator.push(.groupJoin(.enterCode))
            }
        }
        .navigationTitle("홈")
    }
}

#Preview {
    HomeView()
}
