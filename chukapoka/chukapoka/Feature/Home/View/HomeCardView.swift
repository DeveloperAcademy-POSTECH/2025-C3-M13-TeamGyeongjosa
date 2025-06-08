//
//  HomeCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/8/25.
//

import SwiftUI

struct HomeCardView: View {
    var parties: [Party]
    @Binding var currentIndex: Int
    
    var body: some View {
        VStack(spacing: 24) {
            Text("내 파티")
                .font(GSFont.title1)
                .foregroundColor(GSColor.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
            
            CardScrollView(parties: parties, currentIndex: $currentIndex)
//            ForEach(parties, id: \.partyID) { party in
//                let state = PartyCardState.from(date: party.wedding?.date ?? Date())
//                FlippableCardView(
//                    name: party.wedding?.accountName ?? "신랑신부",
//                    groupName: party.name,
//                    weddingDate: party.wedding?.date ?? Date(),
//                    weddingPlace: party.wedding?.place ?? "장소없음",
//                    state: state,
//                    inviteCode: party.inviteCode,
//                    onTapPhoto: {},
//                    onTapClose: {}
//                )
//                
//            }
//            .padding(.horizontal, 16)
        }
        .padding(.top, 30)
    }
}
