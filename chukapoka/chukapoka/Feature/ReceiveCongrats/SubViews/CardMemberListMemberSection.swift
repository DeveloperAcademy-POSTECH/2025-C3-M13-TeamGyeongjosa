//
//  CardMemberListMemberSection.swift
//  chukapoka
//
//  Created by 조유진 on 6/7/25.
//

import SwiftUI

struct CardMemberListMemberSection: View {
    let members: [PartyMember]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if !members.isEmpty {
                Text("멤버(\(members.count)명)")
                    .font(GSFont.body1)
                    .foregroundColor(GSColor.white)
            }
            
            CardMemberListMemberSectionScrollView(members: members)
        }
    }
}
