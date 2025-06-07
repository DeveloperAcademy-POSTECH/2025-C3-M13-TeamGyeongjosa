//
//  CardMemberListLeaderSection.swift
//  chukapoka
//
//  Created by 조유진 on 6/7/25.
//

import SwiftUI

struct CardMemberListLeaderSection: View {
    let role: String
    let name: String
    let money: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(role)")
                .font(GSFont.body1)
                .foregroundColor(GSColor.white)
            
            CardMemberListItem(
                name: name,
                money: money)
        }
        .padding(.top, 10)
    }
}
