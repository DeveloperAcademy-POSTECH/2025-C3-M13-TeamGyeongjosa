//
//  PartyCard+StatusBadge.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//

import SwiftUI

struct PartyCardStatusBadge: View {
    let state: PartyCardState
    
    var body: some View {
        Text(state.badgeText)
            .font(GSFont.caption3)
            .foregroundColor(state.textColor)
            .padding(.horizontal, 5)
            .padding(.vertical, 4)
            .frame(minWidth: 48, alignment: .center)
            .background(state.badgeColor)
            .cornerRadius(8)
    }
}
