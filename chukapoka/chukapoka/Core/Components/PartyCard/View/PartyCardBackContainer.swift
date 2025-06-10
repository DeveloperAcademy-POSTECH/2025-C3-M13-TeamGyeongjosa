//
//  PartyCardBackContainer.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/5/25.
//

import SwiftUI

struct PartyCardBackContainer: View {
    
    let title: String = "모임코드"
    let infoText: String = "같이 화환을 꾸밀 멤버를 초대할 수 있어요"
    let inviteCode: String
    let onTapCodeCopy: (() -> Void)?
    @Binding var coppiedText: String?
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(GSFont.title3)
                .foregroundColor(GSColor.white)
                .frame(
                    maxWidth: .infinity,
                    alignment: .center
                )
                .padding(.top, 51)
            
            Text(infoText)
                .font(GSFont.caption1)
                .foregroundColor(GSColor.white)
                .frame(
                    maxWidth: .infinity,
                    alignment: .center
                    )
                .padding(.bottom, 136)
            
            Text(inviteCode)
                .font(GSFont.invite)
                .foregroundColor(GSColor.white)
                .frame(
                    maxWidth: .infinity,
                    alignment: .center
                    )
                .padding(.bottom, 165)
            
            PrimaryButton(
                title: "코드 복사하기",
                style: .custom(
                    textColor: GSColor.primary,
                    backgroundColor: GSColor.secondary3,
                    isEnable: true),
                action: {
                    coppiedText = inviteCode
                    onTapCodeCopy?()
                }
            )
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
