//
//  ReceiveCardListView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import SwiftUI

struct ReceiveCardListView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    let party: Party
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationBar {
                coordinator.pop()
            }
            Text(party.name)
                .font(GSFont.title2)
                .foregroundColor(GSColor.black)
                .padding(.top, 24)
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
            
                FlowerstandCardList(members: party.members)
        }
    }
}
