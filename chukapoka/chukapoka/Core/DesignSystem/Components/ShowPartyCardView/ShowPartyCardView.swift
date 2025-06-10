//
//  ShowPartyCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//
import SwiftUI

struct ShowPartyCardView: View {
    let leader: PartyMember
    let participants: [PartyMember]
    var onLeaderTapped: (() -> Void)?
    var onMemberTapped: ((PartyMember) -> Void)?
    
    @State private var contentHeight: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("주최자")
                .font(GSFont.body1)
                .foregroundColor(GSColor.secondary3)
                .padding(.top, 10)
            Button(action: {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                onLeaderTapped?()
            }) {
                ShowPartyLeaderView(
                    name: leader.name,
                    money: leader.money
                )
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.top, 8)
            
            Text("참여자 (\(participants.count)명)")
                .font(GSFont.body1)
                .foregroundColor(GSColor.secondary3)
                .padding(.top, 61)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 8) {
                    ForEach(participants) { member in
                        Button {
                            onMemberTapped?(member)
                        } label: {
                            ShowPartyLeaderView(
                                name: member.name,
                                money: member.money
                            )
                        }
                    }
                }
                .background(
                    GeometryReader { geo in
                        Color.clear
                            .preference(key: ViewHeightKey.self, value: geo.size.height)
                    }
                )
                .onPreferenceChange(ViewHeightKey.self) { newHeight in
                    contentHeight = newHeight
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: min(contentHeight, 280))
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

private struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
