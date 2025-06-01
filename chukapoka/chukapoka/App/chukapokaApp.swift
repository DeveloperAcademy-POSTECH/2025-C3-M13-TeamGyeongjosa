//
//  chukapokaApp.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI
import SwiftData

@main
struct chukapokaApp: App {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            RootNavigationView()
                //전역 주입
                .environmentObject(coordinator)
        }
    }
}
