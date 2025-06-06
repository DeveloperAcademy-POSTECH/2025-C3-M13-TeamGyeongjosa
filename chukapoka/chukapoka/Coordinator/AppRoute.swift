//
//  AppRoute.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//
import Foundation

enum AppRoute: Hashable {
    case home
    case createGroupInfoStep1
    case createGroupInfoStep2
    case createGroupInfoStep3
    case joinGroup(JoinGroupRoute)
    case loadingInfoDone
    case createFlowerstand
}

enum CreateGroupRoute: Int, CaseIterable, Hashable {
    case infoStep1
    //    case infoStep2
    //    case enterName
    
    static func next(after step: CreateGroupRoute) -> CreateGroupRoute? {
        let allSteps = Self.allCases
        guard let currentIndex = allSteps.firstIndex(of: step),
              currentIndex + 1 < allSteps.count else { return nil }
        return allSteps[currentIndex + 1]
    }
}

enum JoinGroupRoute: Hashable {
    case enterCode
    //    case joinComplete
}
