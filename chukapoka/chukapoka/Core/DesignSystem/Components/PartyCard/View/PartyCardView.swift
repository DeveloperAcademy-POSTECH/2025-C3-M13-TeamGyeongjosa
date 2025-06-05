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
            PartyCardContainer(
                name: name,
                groupName: groupName,
                weddingDate: weddingDate,
                weddingPlace: weddingPlace,
                state: state,
                height: geometry.size.height,
                onTapPhoto: onTapPhoto,
                onTapClose: onTapClose
            )
        }
    }
}
    
    #Preview {
        PartyCardView(
            name: "지수",
            groupName: "친한친구들",
            weddingDate: Date(),
            weddingPlace: "서울 더라빌",
            state: .archived,
            onTapPhoto: { print("사진 버튼 클릭") },
            onTapClose: { print("닫기 버튼 클릭") }
        )
    }
