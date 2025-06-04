//
//  PartyCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//
import SwiftUI

struct PartyCardView: View {
    let name: String
    let groupName: String
    let weddingDate: Date
    let weddingPlace: String
    let state: PartyCardState
    let onTapPhoto: (() -> Void)?
    let onTapClose: (() -> Void)?
    
    init(
        name: String,
        groupName: String,
        weddingDate: Date,
        weddingPlace: String,
        state: PartyCardState,
        onTapPhoto: (() -> Void)? = nil,
        onTapClose: (() -> Void)? = nil
    ) {
        self.name = name
        self.groupName = groupName
        self.weddingDate = weddingDate
        self.weddingPlace = weddingPlace
        self.state = state
        self.onTapPhoto = onTapPhoto
        self.onTapClose = onTapClose
    }
    
    var body: some View {
        GeometryReader { geometry in
            buildCardView(height: geometry.size.height)
        }
    }
    
    @ViewBuilder
    private func buildCardView(height: CGFloat) -> some View {
        VStack(spacing: 0) {
            HStack {
                statusBadgeView()
                Spacer()
                actionIconsView()
            }
            .padding(.bottom, 16)
            
            titleView()
                .padding(.bottom, 266)
            
            groupNameView()
                .padding(.bottom, 16)
            
            infoTextView()
                .padding(.bottom, 16)
            
            inviteCodeCopyButton()
    
        }
        .padding(16)
        .background(cardBackground(height: height))
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(
            color: GSColor.cardRed2.opacity(0.3),
            radius: 30,
            x: 0,
            y: 4
        )
    }
    
    private func titleView() -> some View {
        PartyCardTitle(name: name)
    }
    
    private func groupNameView() -> some View {
        PartyCardGroupName(groupName: groupName)
    }
    
    private func infoTextView() -> some View {
        PartyCardInfoText(weddingDate: weddingDate, weddingPlace: weddingPlace)
    }
    
    private func statusBadgeView() -> some View {
        PartyCardStatusBadge(state: state)
    }
    
    private func actionIconsView() -> some View {
        PartyCardActionIcons(
            onTapPhoto: { onTapPhoto?() },
            onTapClose: { onTapClose?() }
        )
    }
    
    private func inviteCodeCopyButton() -> some View {
        PrimaryButton(title: "코드로 초대하기")
    }
    
    private func cardBackground(height: CGFloat) -> some View {
        ZStack {
            LinearGradient(
                colors: [
                    GSColor.cardRed1.opacity(0.0),
                    GSColor.cardRed1.opacity(1.0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .opacity(0.2)
            
            LinearGradient(
                colors: [
                    GSColor.cardRed2.opacity(1.0),
                    GSColor.cardYellow.opacity(1.0)
                ],
                startPoint: UnitPoint(x: 0.5, y: 0.38),
                endPoint: .bottom
            )
            .opacity(0.5)
        }
    }
}

#Preview {
    PartyCardView(
        name: "지수",
        groupName: "친한친구들",
        weddingDate: Date(),
        weddingPlace: "서울 더라빌",
        state: .dDay(30),
        onTapPhoto: { print("사진 버튼 클릭") },
        onTapClose: { print("닫기 버튼 클릭") }
    )
}
