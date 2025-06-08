import SwiftUI
import PhotosUI

struct InvitationOCRView: View {
    @State private var showScan = true
    @ObservedObject var ocrViewModel: OCRViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    @StateObject private var viewModel: CreateGroupViewModel
    
    init(ocrViewModel: OCRViewModel, coordinator: AppCoordinator) {
        self.ocrViewModel = ocrViewModel
        _viewModel = StateObject(wrappedValue: CreateGroupViewModel(coordinator: coordinator))
    }
    
    var body: some View {
        VStack {
            if ocrViewModel.selectedImage == nil {
                PhotoPickerView(viewModel: viewModel, ocrViewModel: ocrViewModel)
            } else {
                if showScan {
                    PhotoScanView(image: ocrViewModel.selectedImage!) {
                        showScan = false
                    }
                } else {
                    OCRResultView(viewModel: viewModel, ocrViewModel: ocrViewModel)
                }
            }
        }
        .onChange(of: ocrViewModel.selectedItem) { _, newItem in
            guard let newItem else { return }
            ocrViewModel.handleImageSelection(from: newItem) {
                // OCR 완료 후 화면 전환은 자동으로 처리됨
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
