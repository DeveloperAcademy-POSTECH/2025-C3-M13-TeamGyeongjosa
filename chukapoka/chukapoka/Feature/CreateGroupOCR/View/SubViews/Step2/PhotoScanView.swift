//import SwiftUI
//
//struct PhotoScanView: View {
//    let image: UIImage
//    var onFinished: () -> Void
//    @State private var isAnimating = false
//    
//    @State private var scanLineOffset: CGFloat = -200
//    
//    var body: some View {
//        ZStack {
//            // 선택한 이미지 표시
//            Image(uiImage: image)
//                .resizable()
//                .scaledToFit()
//                .edgesIgnoringSafeArea(.all)
////                .overlay(
////                    LinearGradient(
////                        gradient: Gradient(colors: [.clear, .white.opacity(0.05), .clear]),
////                        startPoint: .top,
////                        endPoint: .bottom
////                    )
////                    .blendMode(.overlay)
////                )
//            
//            // 스캔 라인 애니메이션
//            GeometryReader { geometry in
//                Rectangle()
//                    .fill(
//                        LinearGradient(
//                            gradient: Gradient(colors: [Color("secondary1").opacity(0.4), Color.clear]),
//                            startPoint: .top,
//                            endPoint: .bottom
//                        )
//                    )
//                    .frame(height: 100)
//                    .offset(y: scanLineOffset)
//                    .onAppear {
//                        withAnimation(
//                            Animation.linear(duration: 3)
//                                .repeatForever(autoreverses: false)
//                        ) {
//                            scanLineOffset = geometry.size.height + 200
//                            isAnimating = true
//                        }
//                        
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//                            onFinished()
//                        }
//                    }
//            }
//        }
//    }
//}
//


import SwiftUI

struct PhotoScanView: View {
    let image: UIImage
    @State private var scanLineOffset: CGFloat = -200
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            // 선택한 이미지 표시
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
            // 스캔 라인 애니메이션
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
                    }
                    .background(Color.black)
            }
        }
    }
}
