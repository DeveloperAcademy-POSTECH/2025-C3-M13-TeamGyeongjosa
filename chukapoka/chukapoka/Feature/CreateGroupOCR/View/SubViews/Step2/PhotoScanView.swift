//
//  ImagePickerView.swift
//  chukapoka
//
//  Created by jenki on 6/6/25.
//

import SwiftUI

struct PhotoScanView: View {
    let image: UIImage
    var onFinished: () -> Void
    @State private var scanLineOffset: CGFloat = -200
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)

            GeometryReader { geometry in
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.secondary1.opacity(0.4), Color.clear]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(height: 100)
                    .offset(y: scanLineOffset)
                    .onAppear {
                        withAnimation(
                            Animation.linear(duration: 3)
                                .repeatForever(autoreverses: false)
                        ) {
                            scanLineOffset = geometry.size.height + 200
                            isAnimating = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            onFinished()
                        }
                    }
                    .background(Color.black)
            }
        }
    }
}
