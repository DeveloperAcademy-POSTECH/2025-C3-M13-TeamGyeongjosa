//
//  ReceiveFlippableCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import SwiftUI

struct ReceiveFlippableCardView: View {
    
    let party: Party
    let height: CGFloat = 525
    
    @State private var isFlipped: Bool = false
    
    var body: some View {
        ZStack {
            ReceiveFlippableFrontCardView(
                groupName: party.name,
                weddingDate: party.wedding?.date ?? Date(),
                weddingPlace: party.wedding?.place ?? "장소 없음",
                height: height
            )
            .opacity(isFlipped ? 0.0 : 1.0)
            .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            
            ReceiveFlippableBackCardView(party: party)
                .opacity(isFlipped ? 1.0 : 0.0)
                .rotation3DEffect(.degrees(isFlipped ? -180 : 0), axis: (x: 0, y: 1, z: 0))
        }
        .frame(height: height)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.6)) {
                isFlipped.toggle()
            }
        }
    }
}
