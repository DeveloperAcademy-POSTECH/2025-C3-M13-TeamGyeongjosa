//
//  TextfieldDown.swift
//  chukapoka
//
//  Created by 김소원 on 6/5/25.
//

import SwiftUI

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}
