import SwiftUI

struct SplashView: View {
    @Binding var isSplashing: Bool
    @State private var opacity: Double = 0
    @State private var scale: CGFloat = 0.8
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                GSColor.primary.ignoresSafeArea()
                
                // 텍스트
                VStack(alignment: .leading, spacing: 8) {
                    Text("추카포카")
                        .font(.custom("Pretendard-Bold", size: 34))
                        .foregroundColor(GSColor.white)
                        .opacity(opacity)
                    
                    Text("부담은 나누고 마음은 모아봐요")
                        .font(GSFont.body2)
                        .foregroundColor(GSColor.white)
                        .opacity(opacity)
                }
                .padding(.top, 239)
                .padding(.leading, 37)
                
                // 하단 이미지 (좌측 하단 절대 위치)
                Image("SplashLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380)
                    .opacity(opacity)
                    .scaleEffect(scale)
                    .position(x: 190,  // 이미지 width/2
                              y: geometry.size.height - 140) // height - 이미지 height/2 + 살짝 더 내림
            }
            .onAppear {
                withAnimation(.easeOut(duration: 1.2)) {
                    self.opacity = 1
                    self.scale = 1
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) {
                    withAnimation {
                        isSplashing = false
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView(isSplashing: .constant(true))
}
