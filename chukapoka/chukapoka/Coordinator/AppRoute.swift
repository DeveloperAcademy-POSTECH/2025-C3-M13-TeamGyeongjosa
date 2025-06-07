//
//  AppRoute.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//
import Foundation

enum AppRoute: Hashable {
    case home
    case createGroup
    case loadingInfoDone(leader: PartyMember)
    case createFlowerstand(leader: PartyMember)
    case loadingFlowerstandDone
    case joinGroup
}
