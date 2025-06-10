//
//  CardMemberListMemberSectionScrollView.swift
//  chukapoka
//
//  Created by 조유진 on 6/7/25.
//

import SwiftUI

struct CardMemberListMemberSectionScrollView: View {
    let members: [PartyMember]
    
    var body: some View {
        ScrollView {
            ForEach(members, id: \.self) { member in
                CardMemberListItem(
                    name: member.name,
                    money: member.money!
                )
            }
        }
        .frame(maxHeight: 232)
        .padding(.bottom, 26)
    }
}
