//
//  ReceiveFlippableFrontCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import SwiftUI

struct ReceiveFlippableFrontCardView: View {
    
    let groupName: String
    let weddingDate: Date
    let weddingPlace: String
    let height: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            PartyCardGroupName(
                groupName: groupName
            )
            .padding(.top, 355)
            .padding(.bottom, 16)
            
            PartyCardInfoText(
                weddingDate: weddingDate,
                weddingPlace: weddingPlace
            )
            .padding(.bottom, 16)
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
