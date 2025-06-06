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
    
}

enum JoinGroupRoute: Hashable {
    case enterCode
    //    case joinComplete
}
