//
//  KeyboardResponder.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/12/25.
//

import Combine
import SwiftUI

final class KeyboardResponder: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    
    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        let willShow = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .compactMap { $0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect }
            .map { $0.height }

        let willHide = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }

        Publishers.Merge(willShow, willHide)
            .receive(on: RunLoop.main)
            .assign(to: \.keyboardHeight, on: self)
            .store(in: &cancellableSet)
    }
}
