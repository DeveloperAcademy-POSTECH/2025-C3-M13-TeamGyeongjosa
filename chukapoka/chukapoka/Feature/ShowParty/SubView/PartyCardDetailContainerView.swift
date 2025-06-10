//
//  PartyCardDetailContainerView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/10/25.
//

import SwiftUI

struct PartyCardDetailContainerView: View {
    @ObservedObject var viewModel: ShowPartyMemberViewModel
    let onSelect: (PartyMember) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 61) {
            if let leader = viewModel.leader {
                CardMemberListLeaderView(
                    role: "주최자",
                    name: leader.name,
                    money: leader.money
                )
            }
            CardMemberListView(
                members: viewModel.members,
                onSelect: onSelect
            )
        }
        .padding(16)
    }
}
