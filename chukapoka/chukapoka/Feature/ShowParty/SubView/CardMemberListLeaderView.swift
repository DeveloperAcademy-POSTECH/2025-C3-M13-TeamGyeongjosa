//
//  CardMemberListLeaderView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/10/25.
//
import SwiftUI

struct CardMemberListLeaderView: View {
    let role: String
    let name: String
    let money: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(role)
                .font(GSFont.body1)
                .foregroundStyle(GSColor.white)
            CardMemberListItem(name: name, money: money)
        }
    }
}
