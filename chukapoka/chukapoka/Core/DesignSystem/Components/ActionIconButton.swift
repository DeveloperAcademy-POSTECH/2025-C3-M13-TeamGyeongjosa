//
//  ActionIconButton.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//
import SwiftUI

struct ActionIconButton: View {
    let systemName: String
    let iconColor: Color
    let backgroundColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Circle()
                .fill(backgroundColor)
                .frame(width: 24, height: 24)
                .overlay(
                    Image(systemName: systemName)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(iconColor)
                )
        }
    }
}
