//
//  PrimaryButton.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/2/25.
//

import SwiftUI
struct PrimaryButton: View {
    let title: String
    let style: PrimaryButtonStyle
    let action: (() -> Void)?
    
    init(title: String,
         style: PrimaryButtonStyle = .basic,
         action: (() -> Void)? = nil) {
        self.title = title
        self.style = style
        self.action = action
    }
    
    private var buttonLabel: some View {
        return Text(title)
            .font(GSFont.body1)
            .foregroundStyle(GSColor.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(style.backgroundColor)
            .cornerRadius(16)
    }
    
    var body: some View {
        Button(action: {
            if let action = action {
                action()
            }
        }, label: {
            buttonLabel
        })
        .disabled(!style.isEnable)
        .padding(.horizontal, 16)
    }
}

enum PrimaryButtonStyle {
    case basic
    case disabled
    
    var textColor: Color {
        switch self {
        case .basic:
            return .white
        case .disabled:
            return .white
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .basic:
            return GSColor.primary
        case .disabled:
            return GSColor.gray1
        }
    }
    
    var isEnable: Bool {
        switch self {
        case .basic:
            return true
        case .disabled:
            return false
        }
    }
}

#Preview {
    PrimaryButton(title: "다음") {
        print("버튼 클릭됨")
    }
}
