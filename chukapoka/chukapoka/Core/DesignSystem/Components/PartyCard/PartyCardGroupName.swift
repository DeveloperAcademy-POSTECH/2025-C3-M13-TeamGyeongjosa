//
//  PartyCardGroupName.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//
import SwiftUI

struct PartyCardGroupName: View {
    let groupName: String
    
    var body: some View {
        Text("\(groupName)")
            .font(GSFont.title3)
            .foregroundColor(GSColor.secondary3)
            .frame(
                maxWidth: .infinity,
                alignment: .center
            )
    }
}

#Preview {
    PartyCardGroupName(groupName: "모임명")
}
