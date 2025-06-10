//
//  SingleCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

struct SingleCardView: View {
    let party: Party
    let width: CGFloat
    let onTapClose: () -> Void
    let onCopy: () -> Void
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        FlippableCardView(
            name: party.wedding?.accountName ?? "신랑신부",
            groupName: party.name,
            weddingDate: party.wedding?.date ?? Date(),
            weddingPlace: party.wedding?.place ?? "장소없음",
            state: PartyCardState.from(date: party.wedding?.date ?? Date()),
            inviteCode: party.inviteCode,
            onTapPhoto: {},
            onTapClose: onTapClose,
            onCopy: {
                onCopy()
            },
            onTapCheckParty: {
                coordinator.push(.showPartyMember(party: party))
            }
        )
        .frame(width: width)
        .padding(.horizontal, 16)
    }
}
