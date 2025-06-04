//
//  AppRoute.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//
import Foundation

enum AppRoute: Hashable {
    case home
    case createGroup(CreateGroupRoute)
    case joinGroup(JoinGroupRoute)
}

enum CreateGroupRoute: Hashable {
    case infoStep1
//    case infoStep2
//    case enterName
}

enum JoinGroupRoute: Hashable {
    case enterCode
//    case joinComplete
}
