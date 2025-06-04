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

        }
        .padding(16)
        .background(Color.black)
        .cornerRadius(16)
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
