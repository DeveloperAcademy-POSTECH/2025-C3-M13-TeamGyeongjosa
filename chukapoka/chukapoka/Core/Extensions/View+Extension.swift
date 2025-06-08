//
//  View+Extension.swift
//  chukapoka
//
//  Created by 조유진 on 6/8/25.
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
