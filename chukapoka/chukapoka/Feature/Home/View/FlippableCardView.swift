//
//  FlippableCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/8/25.
//

import SwiftUI

struct FlippableCardView: View {
    let name: String
    let groupName: String
    let weddingDate: Date
    let weddingPlace: String
    let state: PartyCardState
    let height: CGFloat = 525
    let inviteCode: String
    let onTapPhoto: (() -> Void)?
    let onTapClose: (() -> Void)?
    
    @State private var isFlipped: Bool = false
    @State private var copiedText: String?
    
    var body: some View {
        ZStack {
            FlippableFrontCardView(
                name: name,
                groupName: groupName,
                weddingDate: weddingDate,
                weddingPlace: weddingPlace,
                state: state,
                height: height,
                onTapPhoto: onTapPhoto,
                onTapClose: onTapClose
            )
            .opacity(isFlipped ? 0.0 : 1.0)
            .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            
            FlippableBackCardView(
                inviteCode: inviteCode,
                height: height,
                copiedText: $copiedText
            )
            .opacity(isFlipped ? 1.0 : 0.0)
            .rotation3DEffect(.degrees(isFlipped ? 0 : -180), axis: (x: 0, y: 1, z: 0))
        }
        .frame(height: height)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.6)) {
                isFlipped.toggle()
            }
        }
    }
}
