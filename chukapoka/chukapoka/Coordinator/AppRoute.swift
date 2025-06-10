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
    case joinGroupStep1
    case joinGroupStep2(party: Party)
    case loadingJoinGroupDone
    case showPartyMember(party: Party)
}
