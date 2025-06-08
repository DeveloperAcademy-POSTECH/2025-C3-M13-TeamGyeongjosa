import SwiftUI
import PhotosUI
//
//struct InvitationOCRView: View {
//    @ObservedObject var ocrviewModel: OCRViewModel
//    @EnvironmentObject var coordinator: AppCoordinator
//    @StateObject private var viewModel: CreateGroupViewModel
//
//    @State private var didPerformOCR = false
//
//    init(ocrviewModel: OCRViewModel, coordinator: AppCoordinator) {
//        self.ocrviewModel = ocrviewModel
//        self._viewModel = StateObject(wrappedValue: CreateGroupViewModel(coordinator: coordinator))
//    }
//
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 24) {
//                // ✅ 이미지 선택 버튼
//                PhotoPickerView(viewModel: viewModel, ocrViewModel: ocrviewModel)
//
//                // ✅ OCR 결과 전 미리보기 이미지
//                if let image = ocrviewModel.selectedImage {
//                    Image(uiImage: image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(height: 200)
//                        .cornerRadius(10)
//                }
//
//                // ✅ OCR 결과 표시
//                if !ocrviewModel.recognizedTextLines.isEmpty {
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text("인식된 텍스트")
//                            .font(.headline)
//
//                        ForEach(ocrviewModel.recognizedTextLines, id: \.self) { line in
//                            Text("• \(line)")
//                                .font(.body)
//                        }
//
//                        Button("다음으로") {
//                            coordinator.push(.loadingInfoDone)
//                        }
//                        .padding(.top, 12)
//                    }
//                    .padding()
//                    .background(Color(.secondarySystemBackground))
//                    .cornerRadius(10)
//                }
//            }
//            .padding()
//        }
//        .onChange(of: ocrviewModel.selectedItem) { _, newValue in
//            guard let newValue else { return }
//            // OCR 수행
//            ocrviewModel.handleImageSelection(from: newValue) {
//                // OCR 완료 후 화면에 결과 보여주기만 (다음 화면으로는 사용자가 직접 버튼 눌러 이동)
//                didPerformOCR = true
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//        
////        .onChange(of: ocrViewModel.selectedItem) { _, newValue in
////            guard let item = newValue else { return }
////            ocrViewModel.handleImageSelection(from: item) {
////                coordinator.push(.ocrResult) // 🔥 OCR 결과 전용 뷰로 이동
////            }
////        }
//
//    }
//}


struct InvitationOCRView: View {
    @ObservedObject var ocrViewModel: OCRViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // MARK: - 선택된 이미지
                if let image = ocrViewModel.selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                }

                // MARK: - OCR 결과
                if !ocrViewModel.recognizedTextLines.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("인식된 텍스트")
                            .font(.headline)

                        ForEach(ocrViewModel.recognizedTextLines, id: \.self) { line in
                            Text("• \(line)").font(.body)
                        }

                        Button("다음으로") {
                            coordinator.push(.loadingInfoDone)
                        }
                        .padding(.top, 12)
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}
