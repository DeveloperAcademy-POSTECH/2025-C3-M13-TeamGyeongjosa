import SwiftUI
import PhotosUI
//
//struct InvitationOCRView: View {
//    @State private var showScan = true
//    @ObservedObject var ocrViewModel: OCRViewModel
////    @EnvironmentObject var coordinator: AppCoordinator
//    @StateObject private var viewModel: CreateGroupViewModel
//    @Environment(\.dismiss) private var dismiss
//    
////    init(ocrViewModel: OCRViewModel, coordinator: AppCoordinator) {
////        self.ocrViewModel = ocrViewModel
////        _viewModel = StateObject(wrappedValue: CreateGroupViewModel(coordinator: coordinator))
////    }
//    
//    var body: some View {
//        VStack {
//            if ocrViewModel.selectedImage == nil {
//                PhotoPickerView(viewModel: viewModel, ocrViewModel: ocrViewModel)
//            } else {
//                if showScan {
//                    PhotoScanView(image: ocrViewModel.selectedImage!) {
//                        showScan = false
//                    }
//                } else {
//                    OCRResultView(viewModel: viewModel, ocrViewModel: ocrViewModel)
//                }
//            }
//        }
//        .onChange(of: ocrViewModel.selectedItem) { _, newItem in
//            guard let newItem else { return }
//            ocrViewModel.handleImageSelection(from: newItem) {
//                // OCR 완료 후 화면 전환은 자동으로 처리됨
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//}




struct InvitationOCRView: View {
    @State private var currentStep: OCRStep = .photoPicker
    @ObservedObject var ocrViewModel: OCRViewModel
    @StateObject private var viewModel: CreateGroupViewModel

    init(viewModel: CreateGroupViewModel, ocrViewModel: OCRViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.ocrViewModel = ocrViewModel
    }
    
    enum OCRStep {
        case photoPicker
        case scan
        case result
        case group
    }

    var body: some View {
        VStack {
            switch currentStep {
            case .photoPicker:
                PhotoPickerView(viewModel: viewModel, ocrViewModel: ocrViewModel)
            case .scan:
                if let image = ocrViewModel.selectedImage {
                    PhotoScanView(image: image) {
                        currentStep = .result
                    }
                }
            case .result:
                OCRResultView(viewModel: viewModel, ocrViewModel: ocrViewModel, currentStep: $currentStep,
                              onNext: {currentStep = .group}
                              )
//                              {
//                    currentStep = .group
//                }
            case .group:
                CreateGroupView(viewModel: viewModel)
            }
        }
        .onChange(of: ocrViewModel.selectedItem) { _, newItem in
            guard let newItem else { return }
            ocrViewModel.handleImageSelection(from: newItem) {
                currentStep = .scan
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
