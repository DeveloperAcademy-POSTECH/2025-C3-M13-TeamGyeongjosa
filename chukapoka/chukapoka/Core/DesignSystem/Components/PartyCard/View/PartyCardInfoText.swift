//
//  PartyCard+InfoText.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//

import SwiftUI

struct PartyCardInfoText: View {
    let weddingDate: Date
    let weddingPlace: String
    
    var body: some View {
        Text("\(formattedDate)\n\(weddingPlace)")
            .font(GSFont.caption3)
            .foregroundColor(GSColor.secondary3)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
    }
    
    private var formattedDate: String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월 d일 (E)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: weddingDate)
    }
}
