////////////
////////////  InvitationOCRView.swift
////////////  chukapoka
////////////
////////////  Created by jenki on 6/8/25.
////////////
//////////
//////////import SwiftUI
//////////
//////////struct InvitationOCRView: View {
//////////    @ObservedObject var ocrviewModel: OCRViewModel
//////////    @EnvironmentObject var coordinator: AppCoordinator
//////////    @StateObject private var viewModel: CreateGroupViewModel
//////////    
//////////    
//////////    init(ocrviewModel: OCRViewModel, coordinator: AppCoordinator) {
//////////        self.ocrviewModel = ocrviewModel
//////////        self._viewModel = StateObject(wrappedValue: CreateGroupViewModel(coordinator: coordinator))
//////////    }
//////////    
//////////    var body: some View {
//////////        VStack {
//////////            // 청첩장 이미지 + 버튼
//////////            ImagePickerView(viewModel: viewModel, ocrViewModel: ocrviewModel)
//////////            
//////////            // OCR 결과가 있을 경우 표시
//////////            if let image = ocrviewModel.selectedImage {
//////////                Image(uiImage: image)
//////////                    .resizable()
//////////                    .scaledToFit()
//////////                    .frame(height: 200)
//////////                    .cornerRadius(10)
//////////            }
//////////            
//////////            if !ocrviewModel.recognizedTextLines.isEmpty {
//////////                VStack(alignment: .leading, spacing: 8) {
//////////                    Text("인식된 텍스트")
//////////                        .font(.headline)
//////////                    ForEach(ocrviewModel.recognizedTextLines, id: \.self) { line in
//////////                        Text("• \(line)")
//////////                            .font(.body)
//////////                    }
//////////                    
//////////                    Button("다음으로") {
//////////                        coordinator.push(.loadingInfoDone)
//////////                    }
//////////                    .padding(.top, 12)
//////////                }
//////////                .padding()
//////////                .background(Color(.secondarySystemBackground))
//////////                .cornerRadius(10)
//////////            }
//////////            
//////////            Spacer()
//////////        }
//////////        .padding()
//////////    }
//////////}
////////
////////
//////////
//////////  InvitationOCRView.swift
//////////  chukapoka
//////////
//////////  Created by jenki on 6/8/25.
//////////
////////
////////import SwiftUI
////////
////////struct InvitationOCRView: View {
////////    @ObservedObject var ocrviewModel: OCRViewModel
////////    @EnvironmentObject var coordinator: AppCoordinator
////////    @StateObject private var viewModel: CreateGroupViewModel
////////
////////    init(ocrviewModel: OCRViewModel, coordinator: AppCoordinator) {
////////        self.ocrviewModel = ocrviewModel
////////        self._viewModel = StateObject(wrappedValue: CreateGroupViewModel(coordinator: coordinator))
////////    }
////////
////////    var body: some View {
////////        ScrollView {
////////            VStack(spacing: 16) {
////////                // ✅ 선택된 이미지 표시
////////                if let image = ocrviewModel.selectedImage {
////////                    Image(uiImage: image)
////////                        .resizable()
////////                        .scaledToFit()
////////                        .frame(height: 200)
////////                        .cornerRadius(10)
////////                }
////////
////////                // ✅ OCR 결과가 있을 경우 표시
////////                if !ocrviewModel.recognizedTextLines.isEmpty {
////////                    VStack(alignment: .leading, spacing: 8) {
////////                        Text("인식된 텍스트")
////////                            .font(.headline)
////////
////////                        ForEach(ocrviewModel.recognizedTextLines, id: \.self) { line in
////////                            Text("• \(line)")
////////                                .font(.body)
////////                        }
////////
////////                        Button("다음으로") {
////////                            coordinator.push(.loadingInfoDone)
////////                        }
////////                        .padding(.top, 12)
////////                    }
////////                    .padding()
////////                    .background(Color(.secondarySystemBackground))
////////                    .cornerRadius(10)
////////                }
////////
////////                // ✅ OCR이 아직 없으면 이미지 선택 유도
////////                if ocrviewModel.recognizedTextLines.isEmpty {
////////                    ImagePickerView(viewModel: viewModel, ocrViewModel: ocrviewModel)
////////                }
////////            }
////////            .padding()
////////        }
////////        .navigationBarBackButtonHidden(true)
////////    }
////////}
//////
//////
//////import SwiftUI
//////
//////struct InvitationOCRView: View {
//////    @ObservedObject var ocrviewModel: OCRViewModel
//////    @EnvironmentObject var coordinator: AppCoordinator
//////    @StateObject private var viewModel: CreateGroupViewModel
//////
//////    init(ocrviewModel: OCRViewModel, coordinator: AppCoordinator) {
//////        self.ocrviewModel = ocrviewModel
//////        _viewModel = StateObject(wrappedValue: CreateGroupViewModel(coordinator: coordinator))
//////    }
//////
//////    var body: some View {
//////        ScrollView {
//////            VStack(spacing: 24) {
//////                ImagePickerView(viewModel: viewModel, ocrViewModel: ocrviewModel)
//////
//////                if let image = ocrviewModel.selectedImage {
//////                    Image(uiImage: image)
//////                        .resizable()
//////                        .scaledToFit()
//////                        .frame(height: 200)
//////                        .cornerRadius(10)
//////                }
//////
//////                if !ocrviewModel.recognizedTextLines.isEmpty {
//////                    VStack(alignment: .leading, spacing: 8) {
//////                        Text("인식된 텍스트")
//////                            .font(.headline)
//////
//////                        ForEach(ocrviewModel.recognizedTextLines, id: \.self) { line in
//////                            Text("• \(line)")
//////                                .font(.body)
//////                        }
//////
//////                        Button("다음으로") {
//////                            coordinator.push(.loadingInfoDone)
//////                        }
//////                        .padding(.top, 12)
//////                    }
//////                    .padding()
//////                    .background(Color(.secondarySystemBackground))
//////                    .cornerRadius(10)
//////                }
//////
//////                Spacer()
//////            }
//////            .padding()
//////        }
//////        .onChange(of: ocrviewModel.selectedItem) { newItem in
//////            guard let item = newItem else { return }
//////            ocrviewModel.handleImageSelection(from: item) {
//////                // OCR 완료 후 화면 갱신만, push는 InvitationOCRView의 버튼에서 수행
//////            }
//////        }
//////    }
//////}
////
//////
//////  InvitationOCRView.swift
//////  chukapoka
//////
//////  Created by jenki on 6/8/25.
//////
////
////import SwiftUI
////
////struct InvitationOCRView: View {
////    @ObservedObject var ocrviewModel: OCRViewModel
////
////    var body: some View {
////        VStack(spacing: 16) {
////            // MARK: - 이미지 미리보기
////            if let image = ocrviewModel.selectedImage {
////                Image(uiImage: image)
////                    .resizable()
////                    .scaledToFit()
////                    .frame(height: 200)
////                    .cornerRadius(10)
////            }
////
////            // MARK: - 인식된 텍스트 표시
////            if !ocrviewModel.recognizedTextLines.isEmpty {
////                VStack(alignment: .leading, spacing: 8) {
////                    Text("인식된 텍스트")
////                        .font(.headline)
////                    ForEach(ocrviewModel.recognizedTextLines, id: \.self) { line in
////                        Text("• \(line)")
////                            .font(.body)
////                    }
////                }
////                .padding()
////                .background(Color(.secondarySystemBackground))
////                .cornerRadius(10)
////            }
////
////            Spacer()
////        }
////        .padding(.horizontal, 16)
////    }
////}
//
//
//import SwiftUI
//import PhotosUI
//
//struct InvitationOCRView: View {
//    @ObservedObject var ocrviewModel: OCRViewModel
//    @EnvironmentObject var coordinator: AppCoordinator
//    @StateObject private var viewModel: CreateGroupViewModel
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
//            ocrviewModel.handleImageSelection(from: newValue) {
//                coordinator.push(.loadingInfoDone)
//            }
//        }
//    }
//}


import SwiftUI
import PhotosUI

struct InvitationOCRView: View {
    @ObservedObject var ocrviewModel: OCRViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var viewModel: CreateGroupViewModel

    @State private var didPerformOCR = false

    init(ocrviewModel: OCRViewModel, coordinator: AppCoordinator) {
        self.ocrviewModel = ocrviewModel
        self._viewModel = StateObject(wrappedValue: CreateGroupViewModel(coordinator: coordinator))
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // ✅ 이미지 선택 버튼
                PhotoPickerView(viewModel: viewModel, ocrViewModel: ocrviewModel)

                // ✅ OCR 결과 전 미리보기 이미지
                if let image = ocrviewModel.selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(10)
                }

                // ✅ OCR 결과 표시
                if !ocrviewModel.recognizedTextLines.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("인식된 텍스트")
                            .font(.headline)

                        ForEach(ocrviewModel.recognizedTextLines, id: \.self) { line in
                            Text("• \(line)")
                                .font(.body)
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
            }
            .padding()
        }
//        .onChange(of: ocrviewModel.selectedItem) { _, newValue in
//            guard let newValue else { return }
//            // OCR 수행
//            ocrviewModel.handleImageSelection(from: newValue) {
//                // OCR 완료 후 화면에 결과 보여주기만 (다음 화면으로는 사용자가 직접 버튼 눌러 이동)
//                didPerformOCR = true
//            }
//        }
//        .navigationBarBackButtonHidden(true)
        
        .onChange(of: ocrViewModel.selectedItem) { _, newValue in
            guard let item = newValue else { return }
            ocrViewModel.handleImageSelection(from: item) {
                coordinator.push(.ocrResult) // 🔥 OCR 결과 전용 뷰로 이동
            }
        }

    }
}
