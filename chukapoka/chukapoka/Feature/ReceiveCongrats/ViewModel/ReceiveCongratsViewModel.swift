//
//  ReceiveCongratsViewModel.swift
//  chukapoka
//
//  Created by 조유진 on 6/7/25.
//

import Foundation
import SwiftUI

class ReceiveCongratsViewModel: ObservableObject {
    @Published var groupName: String
    @Published var weddingDate: Date
    @Published var weddingPlace: String
    
    @Published var leader: PartyMember?
    @Published var members: [PartyMember] = []
    
    // 실제 초기화 (실제 데이터 넣을 때)
    init(party: Party, weddingDate: Date, weddingPlace: String) {
        self.groupName = party.name
        self.weddingDate = weddingDate
        self.weddingPlace = weddingPlace

        let allMembers = party.members
        self.leader = allMembers.first(where: { $0.isLeader })
        self.members = allMembers.filter { !$0.isLeader }
    }
    
    static func mock() -> ReceiveCongratsViewModel {
        let leader = PartyMember(
            isLeader: true,
            name: "데미안",
            accountNumber: "123-456-789",
            phoneNumber: "010-1111-2222",
            money: 10,
            message: "결혼 축하해!",
            flowerstandPath: "path/to/flower1.png"
        )

        let member1 = PartyMember(
            isLeader: false,
            name: "모세",
            accountNumber: "222-333-444",
            phoneNumber: "010-2222-3333",
            money: 5,
            message: "잘 살아~",
            flowerstandPath: "path/to/flower2.png"
        )

        let member2 = PartyMember(
            isLeader: false,
            name: "젠키",
            accountNumber: "555-666-777",
            phoneNumber: "010-3333-4444",
            money: 7,
            message: "행복하길!",
            flowerstandPath: "path/to/flower3.png"
        )

        let party = Party(
            name: "친구들",
            photoPath: "photo/path",
            wedding: nil,
            inviteCode: "MM1234"
        )
        party.members = [leader, member1, member2]
        
        return ReceiveCongratsViewModel(
            party: party,
            weddingDate: Date(),
            weddingPlace: "서울 성당"
        )
    }
}
