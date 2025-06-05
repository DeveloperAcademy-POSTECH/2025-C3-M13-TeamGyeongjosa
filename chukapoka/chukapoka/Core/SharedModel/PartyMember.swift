//
//  PartyMember.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//

import Foundation
import SwiftData

@Model
final class PartyMember {
    var isLeader: Bool
    var name: String
    var accountNumber: Int
    var phoneNumber: Int
    var money: Int
    var message: String
    var flowerstandPath: String

    // 역관계: PartyMember ⟵ Party (N:1)
    @Relationship(inverse: \Party.members) var party: Party?

    init(
        isLeader: Bool,
        name: String,
        accountNumber: Int,
        phoneNumber: Int,
        money: Int,
        message: String,
        flowerstandPath: String,
        party: Party? = nil
    ) {
        self.isLeader = isLeader
        self.name = name
        self.accountNumber = accountNumber
        self.phoneNumber = phoneNumber
        self.money = money
        self.message = message
        self.flowerstandPath = flowerstandPath
        self.party = party
    }
}
