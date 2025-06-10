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
            .foregroundStyle(style.textColor)
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
    }
}

enum PrimaryButtonStyle {
    case basic
    case disabled
    case custom(textColor: Color, backgroundColor: Color, isEnable: Bool)
    
    var textColor: Color {
        switch self {
        case .basic:
            return .white
        case .disabled:
            return .white
        case .custom(let textColor, _, _):
            return textColor
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .basic:
            return GSColor.primary
        case .disabled:
            return GSColor.gray1
        case .custom(_, let backgroundColor, _):
            return backgroundColor
        }
    }
    
    var isEnable: Bool {
        switch self {
        case .basic:
            return true
        case .disabled:
            return false
        case .custom(_, _, let isEnable):
            return isEnable
        }
    }
}

#Preview {
    PrimaryButton(title: "다음") {
        print("버튼 클릭됨")
    }
}
