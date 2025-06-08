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
    
    var body: some View {
        FlippableCardView(
            name: party.wedding?.accountName ?? "신랑신부",
            groupName: party.name,
            weddingDate: party.wedding?.date ?? Date(),
            weddingPlace: party.wedding?.place ?? "장소없음",
            state: PartyCardState.from(date: party.wedding?.date ?? Date()),
            inviteCode: party.inviteCode,
            onTapPhoto: {},
            onTapClose: onTapClose
        )
        .frame(width: width)
        .padding(.horizontal, 16)
    }
}
