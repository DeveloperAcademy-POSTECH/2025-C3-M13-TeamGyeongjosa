//
//  ShowPartyNameView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import SwiftUI

struct ShowPartyNameView: View {
    let partyName: String
    
    var body: some View {
        HStack {
            Text(partyName)
                .font(GSFont.title1)
                .foregroundStyle(GSColor.black)
            Spacer()
        }
        .padding(.leading, 16)
    }
}
