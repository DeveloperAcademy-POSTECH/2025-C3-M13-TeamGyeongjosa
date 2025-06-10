//
//  CardMemberListScrollView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/10/25.
//
import SwiftUI

struct CardMemberListScrollView: View {
    let members: [PartyMember]
    let onSelect: (PartyMember) -> Void

    var body: some View {
        ScrollView {
            ForEach(members, id: \ .self) { member in
                CardMemberListItem(
                    name: member.name,
                    money: member.money
                )
                .onTapGesture {
                    onSelect(member)
                }
            }
        }
        .frame(maxHeight: 232)
        .padding(.bottom, 26)
    }
}
