//
//  PartyMember.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//

import Foundation
import SwiftData

@Model
final class PartyMember: Identifiable {
    @Attribute(.unique)
    var id: UUID
    var isLeader: Bool
    var name: String
    var accountNumber: String
    var phoneNumber: String
    var money: Int?
    var message: String
    var flowerstandPath: String
    
    // 역관계: PartyMember ⟵ Party (N:1)
    @Relationship(inverse: \Party.members)
    var party: Party?
    
    init(
        id: UUID = UUID(),
        isLeader: Bool,
        name: String,
        accountNumber: String,
        phoneNumber: String,
        money: Int?,
        message: String,
        flowerstandPath: String,
        party: Party? = nil
    ) {
        self.id = id
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
