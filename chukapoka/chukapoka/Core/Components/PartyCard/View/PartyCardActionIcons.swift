//
//  PartyCard+ActionIcons.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//
import SwiftUI

struct PartyCardActionIcons: View {
    let onTapPhoto: () -> Void
    let onTapClose: () -> Void

    var body: some View {
        HStack(spacing: 8) {
            ActionIconButton(
                systemName: "photo.artframe.circle.fill",
                iconColor: GSColor.white,
                backgroundColor: GSColor.primary,
                action: onTapPhoto
            )
            ActionIconButton(
                systemName: "xmark.circle.fill",
                iconColor: GSColor.white,
                backgroundColor: GSColor.primary,
                action: onTapClose
            )
        }
    }
}
