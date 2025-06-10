//
//  ShowPartyFlowers.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/10/25.
//
import SwiftUI

struct ShowPartyFlowers: View {
    let member: PartyMember
    let onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    onDismiss()
                }
            
            VStack(spacing: 16) {
                Text("\(member.name)의 화환")
                    .font(GSFont.title2)
                    .foregroundColor(.white)
                
                ShowFlowerStandView(
                    card: ShowFlowerstandCardItem(
                        name: member.name,
                        backgroundColor: .pink, // TODO: path → color 매핑 로직 필요
                        imagePath: member.flowerstandPath
                    )
                )
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(radius: 10)
            .frame(width: 250, height: 250)
        }
        .transition(.opacity)
        .animation(.easeInOut, value: member)
    }
}
