//
//  AppCoordinator.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

@MainActor
final class AppCoordinator: ObservableObject {
    
    // Navigation Stack과 바인딩할 Path
    @Published var path: [AppRoute] = []
    
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    // 현재 스택에서 마지막 화면 1개 삭제
    func pop() {
        path.removeLast()
    }
    
    // 홈으로 이동
    func popToRoot() {
        path.removeLast(path.count)
    }
}
