//
//  ToastView.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI

struct ToastView: View {
    let message: String

    var body: some View {
        Text(message)
            .font(.caption)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(.black.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(8)
            .transition(.move(edge: .bottom).combined(with: .opacity))
    }
}
