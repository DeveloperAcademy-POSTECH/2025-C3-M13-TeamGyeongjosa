import SwiftUI
import PhotosUI

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
        case info
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
                              onNext: {currentStep = .info}
                )
            case .info:
                MyinfoView(viewModel: viewModel)
            }
        }
        .onChange(of: ocrViewModel.selectedItem) { _, newItem in
            guard let newItem else { return }
            ocrViewModel.handleImageSelection(from: newItem) {
                currentStep = .scan
            }
        }
        .onChange(of: currentStep) { _, newStep in
            if newStep == .photoPicker {
                ocrViewModel.reset()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
