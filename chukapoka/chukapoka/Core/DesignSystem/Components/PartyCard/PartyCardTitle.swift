//
//  PartyCard+Title.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//

import SwiftUI

struct PartyCardTitle: View {
    let name: String
    
    var body: some View {
        Text("\(name)님을 위한 추카파티")
            .font(GSFont.title3)
            .foregroundColor(GSColor.secondary3)
            .frame(
                maxWidth: .infinity,
                alignment: .leading)
    }
}
