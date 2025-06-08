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
        // 이후 NavigationBar로 대체
        HStack {
            Button(action: {}) {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 12)
                    .foregroundColor(GSColor.black)
            }
            
            Spacer()
            
            Text("\(partyName)")
                .font(GSFont.body1)
                .foregroundColor(GSColor.black)
            
            Spacer()
        }
        .padding(16)
        
        FlowerstandCardList()
    }
}
