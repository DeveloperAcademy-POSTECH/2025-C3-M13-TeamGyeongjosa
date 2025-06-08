//
//  ReceiveCongratsCardBackView.swift
//  chukapoka
//
//  Created by 조유진 on 6/7/25.
//

import SwiftUI

struct ReceiveCongratsCardBackView: View {
    let leader: PartyMember?
    let members: [PartyMember]
    let height: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 61) {
            if let leader = leader {
                CardMemberListLeaderSection(
                    role: "주최자",
                    name: leader.name,
                    money: leader.money
                )
            }
            
            CardMemberListMemberSection(
                members: members
            )
        }
        .padding(.top, 26)
        .padding(.bottom, 42)
        .padding(.horizontal, 16)
        .background(PartyCardBackground())
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(color: GSColor.cardRed2.opacity(0.3), radius: 30, x: 0, y: 4)
    }
}
