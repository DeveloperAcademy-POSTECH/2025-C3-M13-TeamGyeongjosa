//
//  FlippableFrontCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/8/25.
//

import SwiftUI

struct FlippableFrontCardView: View {
    let name: String
    let groupName: String
    let weddingDate: Date
    let weddingPlace: String
    let state: PartyCardState
    let height: CGFloat
    let onTapPhoto: (() -> Void)?
    let onTapClose: (() -> Void)?

    var body: some View {
        PartyCardView(
            name: name,
            groupName: groupName,
            weddingDate: weddingDate,
            weddingPlace: weddingPlace,
            state: state,
            onTapPhoto: onTapPhoto,
            onTapClose: onTapClose
        )
        .frame(height: height)
    }
}
