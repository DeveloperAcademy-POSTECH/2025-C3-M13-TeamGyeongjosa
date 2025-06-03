//
//  AppRoute.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//
import Foundation

enum AppRoute: Hashable {
    case home
    case groupCreate(GroupCreateRoute)
    case groupJoin(GroupJoinRoute)
}

enum GroupCreateRoute: Hashable {
    case infoStep1
//    case infoStep2
//    case enterName
}

enum GroupJoinRoute: Hashable {
    case enterCode
//    case joinComplete
}
