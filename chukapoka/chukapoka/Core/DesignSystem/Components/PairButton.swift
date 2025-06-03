//
//  PairButton.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/2/25.
//
import SwiftUI

struct PairButton: View {
    let leftTitle: String
    let rightTitle: String
    let leftStyle: PrimaryButtonStyle
    let rightStyle: PrimaryButtonStyle
    let leftAction: () -> Void
    let rightAction: () -> Void
    
    var body: some View {
        HStack(spacing: 8) {
            PrimaryButton(title: leftTitle, style: leftStyle, action: leftAction)
                .frame(height: 50)
            PrimaryButton(title: rightTitle, style: rightStyle, action: rightAction)
                .frame(height: 50)
        }
    }
}

#Preview("PairButton Sample") {
    PairButton(
        leftTitle: "그룹 생성하기",
        rightTitle: "코드로 참여하기",
        leftStyle: .custom(textColor: GSColor.primary, backgroundColor: GSColor.secondary3, isEnable: true),
        rightStyle: .custom(textColor: GSColor.white, backgroundColor: GSColor.primary, isEnable: true),
        leftAction: {},
        rightAction: {}
    )
}
