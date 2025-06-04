//
//  PartyCardBackground.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/5/25.
//
import SwiftUI

struct PartyCardBackground: View {
    let height: CGFloat
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    GSColor.cardRed1.opacity(0.0),
                    GSColor.cardRed1.opacity(1.0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .opacity(0.2)
            
            LinearGradient(
                colors: [
                    GSColor.cardRed2.opacity(1.0),
                    GSColor.cardYellow.opacity(1.0)
                ],
                startPoint: UnitPoint(x: 0.5, y: 0.38),
                endPoint: .bottom
            )
            .opacity(0.5)
        }
    }
}
