//
//  RecieveSingleCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import SwiftUI

struct ReceiveSingleCardView: View {
    let party: Party
    let width: CGFloat
    
    var body: some View {
        ReceiveFlippableCardView(party: party)
            .frame(width: width)
            .padding(.horizontal, 16)
        
    }
}
