//
//  PartyCardBackView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/5/25.
//

import SwiftUI

struct PartyCardBackView: View {
    let inviteCode: String
    let onTapCodeCopy: (() -> Void)?
    @Binding var copiedText: String?
    
    init(
        inviteCode: String,
        onTapCodeCopy: (() -> Void)? = nil,
        copiedText: Binding<String?>
    ) {
        self.inviteCode = inviteCode
        self.onTapCodeCopy = onTapCodeCopy
        self._copiedText = copiedText
    }

    var body: some View {
        GeometryReader { _ in
            PartyCardBackContainer(
                inviteCode: inviteCode,
                onTapCodeCopy: onTapCodeCopy,
                coppiedText: $copiedText
            )
        }
    }
}
