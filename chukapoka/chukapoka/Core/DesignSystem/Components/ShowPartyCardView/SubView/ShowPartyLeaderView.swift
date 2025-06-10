//
//  ShowPartyLeaderView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//
import SwiftUI

struct ShowPartyLeaderView: View {
    let name: String
    let money: Int?
    
    var body: some View {
        HStack {
            Text(name)
                .font(GSFont.body1)
                .foregroundColor(GSColor.black)
            
            Spacer()
            
            if let money = money {
                Text("\(money)만원")
                    .font(GSFont.body1)
                    .foregroundColor(GSColor.black)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 17)
        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40, alignment: .center)
        .background(
            GSColor.secondary3
        )
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(.white, lineWidth: 1)
        )
    }
}

#Preview {
    ShowPartyLeaderView(
        name: "데미안",
        money: 12000
    )
}
