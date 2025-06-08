//
//  chukapokaApp.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

@main
struct ChukapokaApp: App {
    @StateObject private var coordinator: AppCoordinator = AppCoordinator()
    @State private var isSplashing: Bool = true
    @State private var isOnboadingDone: Bool = false
    
    //    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            if isSplashing {
                SplashView(isSplashing: $isSplashing)
            } else if !isOnboadingDone {
                OnboardingView(isOnboardingDone: $isOnboadingDone)
            } else {
                RootNavigationView()
                // 전역 주입
                .environmentObject(coordinator)
                .modelContainer(for: [Wedding.self, Party.self, PartyMember.self])
                }
        }
    }
}
