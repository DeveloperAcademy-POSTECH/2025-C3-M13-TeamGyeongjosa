import SwiftUI
import PhotosUI

struct InvitationOCRView: View {
    @ObservedObject var ocrViewModel: OCRViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                // MARK: - 선택된 이미지 (갤러리에서 선택한 이미지)
                if let image = ocrViewModel.selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 300)
                        .cornerRadius(10)
                } else {
                    Text("청첩장 이미지를 선택해주세요")
                        .foregroundColor(.gray)
                }

                // MARK: - OCR 결과 텍스트 출력
                if !ocrViewModel.recognizedTextLines.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("인식된 텍스트")
                            .font(.headline)

                        ForEach(ocrViewModel.recognizedTextLines, id: \.self) { line in
                            Text("• \(line)")
                                .font(.body)
                        }

                        Button(action: {
                            coordinator.push(.loadingInfoDone)
                        }) {
                            Text("다음으로")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.top, 12)
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("청첩장 OCR")
        .onAppear {
            // 필요 시 여기서 로깅이나 초기화 가능
        }
    }
}
