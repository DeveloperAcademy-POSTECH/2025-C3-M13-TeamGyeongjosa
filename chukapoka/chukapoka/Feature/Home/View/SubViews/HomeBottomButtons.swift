//
//  HomeBottomButtons.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//
import SwiftUI

struct HomeBottomButtons: View {
    let onGroupCreateTapped: () -> Void
    let onGroupJoinTapped: () -> Void
    
    var body: some View {
        PairButton(
            leftTitle: "파티장으로 참여하기",
            rightTitle: "파티원으로 참여하기",
            leftStyle: .custom(
                textColor: GSColor.primary,
                backgroundColor: GSColor.secondary3,
                isEnable: true),
            rightStyle: .custom(
                textColor: GSColor.white,
                backgroundColor: GSColor.primary,
                isEnable: true),
            leftAction: onGroupCreateTapped,
            rightAction: onGroupJoinTapped
        )
        .padding(.horizontal, 16)
    }
}
