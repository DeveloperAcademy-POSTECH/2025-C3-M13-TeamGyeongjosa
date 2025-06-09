//
//  ShowFlowerstandCardsView.swift
//  chukapoka
//
//  Created by 조유진 on 6/7/25.
//

import SwiftUI

struct ShowFlowerstandCardsView: View {
    let partyName: String
    
    var body: some View {
        ZStack {
            NavigationBar(onBack: {})
            HStack {
                Spacer()
                Text(partyName)
                    .font(GSFont.body1)
                    .foregroundColor(GSColor.black)
                Spacer()
            }
        }
        FlowerstandCardList()
    }
}
