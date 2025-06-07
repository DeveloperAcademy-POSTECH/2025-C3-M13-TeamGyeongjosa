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
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            RootNavigationView()
                // 전역 주입
                .environmentObject(coordinator)
                .modelContainer(for: [Wedding.self, Party.self, PartyMember.self])
        }
    }
}
