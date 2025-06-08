//
//  FlippableBackCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/8/25.
//

import SwiftUI

struct FlippableBackCardView: View {
    let inviteCode: String
    let height: CGFloat
    @Binding var copiedText: String?

    var body: some View {
        PartyCardBackView(
            inviteCode: inviteCode,
            onTapCodeCopy: {},
            copiedText: $copiedText
        )
        .frame(height: height)
    }
}
