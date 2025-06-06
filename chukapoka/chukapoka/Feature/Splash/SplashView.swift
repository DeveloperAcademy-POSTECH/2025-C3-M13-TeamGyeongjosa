import SwiftUI

struct SplashView: View {
  @State private var isActive = false

  var body: some View {
    if isActive {
      // 메인 화면으로 전환
    } else {
      GeometryReader { geometry in
        ZStack {
          GSColor.primary
            .ignoresSafeArea()

          // 텍스트
          VStack(alignment: .leading) {
            Text("추카포카")
              .font(.custom("Pretendard-Bold", size: 36))
              .foregroundColor(GSColor.white)
              .padding(.bottom, 4)

            Text("부담은 나누고 마음은 모아봐요")
              .font(GSFont.body2)
              .foregroundColor(GSColor.white)

            Spacer()
          }
          .padding(.top, 287)
          .padding(.leading, 37)
          .frame(maxWidth: .infinity, alignment: .leading)

          // 하단 이미지
          Image("Splash")
            .resizable()
            .scaledToFit()
            .frame(height: geometry.size.height * 0.525)
            .position(x: geometry.size.width / 2.19,
                      y: geometry.size.height - (geometry.size.width * imageHeightRatio) / 2.4)
        }
        .onAppear {
          // 3초 뒤 전환
          DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
              isActive = true
            }
          }
        }
      }
    }
  }

  /// 이미지 세로 비율 조정 (비율: 세로 / 가로)
  private let imageHeightRatio: CGFloat = 1
}

#Preview {
  SplashView()
}
