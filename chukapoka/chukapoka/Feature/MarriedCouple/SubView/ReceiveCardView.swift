//
//  ReceiveCardView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import SwiftUI

struct ReceiveCardView: View {
    
    let party: Party
    
    var body: some View {
        ReceiveFlippableCardView(party: party)
            .padding(.vertical, 12)
    }
}
