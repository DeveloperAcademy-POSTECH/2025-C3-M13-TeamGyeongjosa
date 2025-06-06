//
// LottieView.swift
//  chukapoka
//
//  Created by 김소원 on 6/6/25.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var fileName: String

    func makeUIView(context: Context) -> some UIView {
        let view: UIView = UIView()
        let animationView: LottieAnimationView = LottieAnimationView(name: fileName)
        animationView.loopMode = .loop
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
