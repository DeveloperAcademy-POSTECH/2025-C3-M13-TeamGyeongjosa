//
//  Party.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//
import Foundation
import SwiftData

@Model
final class Party {
    @Attribute(.unique) var partyID: Int
    var name: String
    var photoPath: String

    // 관계: Party ⟶ PartyMember (1:N)
    @Relationship(deleteRule: .cascade) var members: [PartyMember] = []

    // 역관계: Party ⟵ Wedding (N:1)
    @Relationship(inverse: \Wedding.parties) var wedding: Wedding?

    init(
        partyID: Int,
        name: String,
        photoPath: String,
        wedding: Wedding? = nil
    ) {
        self.partyID = partyID
        self.name = name
        self.photoPath = photoPath
        self.wedding = wedding
    }
}
