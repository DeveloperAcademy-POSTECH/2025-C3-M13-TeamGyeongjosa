//
//  PartyCardContainer.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/5/25.
//

import SwiftUI

struct PartyCardContainer: View {
    let name: String
    let groupName: String
    let weddingDate: Date
    let weddingPlace: String
    let state: PartyCardState
    let onTapPhoto: (() -> Void)?
    let onTapClose: (() -> Void)?

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                PartyCardStatusBadge(state: state)
                Spacer()
                PartyCardActionIcons(
                    onTapPhoto: { onTapPhoto?() },
                    onTapClose: { onTapClose?() }
                )
            }
            .padding(.bottom, 16)

            PartyCardTitle(name: name)
                .padding(.bottom, 266)

            PartyCardGroupName(groupName: groupName)
                .padding(.bottom, 16)

            PartyCardInfoText(
                weddingDate: weddingDate,
                weddingPlace: weddingPlace
            )
            .padding(.bottom, 16)

            PrimaryButton(title: "파티 확인하기")
        }
        .padding(16)
        .background(PartyCardBackground())
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(
            color: GSColor.cardRed2.opacity(0.3),
            radius: 30,
            x: 0,
            y: 4
        )
    }
}
