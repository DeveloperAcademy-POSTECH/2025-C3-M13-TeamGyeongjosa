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
    @State private var showToast = false
    
    var body: some View {
        VStack(spacing: 0) {
            if parties.isEmpty {
                HomeNormalView()
            } else {
                HomeCardView(
                    parties: parties,
                    currentIndex: $currentIndex,
                    onCopy: {
                        withAnimation {
                            showToast = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showToast = false
                            }
                        }
                    }
                )
            }
            Spacer()
            
            HomeBottomButtons(
                onGroupCreateTapped: {
                    coordinator.push(.createGroup)
                },
                onGroupJoinTapped: {
                    coordinator.push(.joinGroupStep1)
                }
            )
            .padding(.bottom, 24)
        }
        .overlay(
            Group {
                if showToast {
                    ToastView(message: "초대코드가 복사되었어요!")
                        .padding(.bottom, 40)
                }
            },
            alignment: .bottom
        )
    }
}
