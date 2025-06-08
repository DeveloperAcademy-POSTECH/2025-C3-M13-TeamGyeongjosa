//
//  HomeCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/8/25.
//

import SwiftUI

struct HomeCardView: View {
    var parties: [Party]
    @Binding var currentIndex: Int
    
    var body: some View {
        VStack(spacing: 24) {
            Text("내 파티")
                .font(GSFont.title1)
                .foregroundColor(GSColor.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
            
            CardScrollView(parties: parties, currentIndex: $currentIndex)
            
        }
        .padding(.top, 30)
    }
}
