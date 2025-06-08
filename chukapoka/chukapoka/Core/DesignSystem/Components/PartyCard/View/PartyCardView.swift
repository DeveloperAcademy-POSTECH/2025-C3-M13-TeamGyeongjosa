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
    let height: CGFloat
    let onTapPhoto: (() -> Void)?
    let onTapClose: (() -> Void)?
    
    init(
        name: String,
        groupName: String,
        weddingDate: Date,
        weddingPlace: String,
        state: PartyCardState,
        height: CGFloat,
        onTapPhoto: (() -> Void)? = nil,
        onTapClose: (() -> Void)? = nil
    ) {
        self.name = name
        self.groupName = groupName
        self.weddingDate = weddingDate
        self.weddingPlace = weddingPlace
        self.state = state
        self.height = height
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
                height: height,
                onTapPhoto: onTapPhoto,
                onTapClose: onTapClose
            )
        }
    }
}
