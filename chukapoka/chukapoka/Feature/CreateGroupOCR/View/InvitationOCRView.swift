import SwiftUI
import PhotosUI

struct InvitationOCRView: View {
    @ObservedObject var ocrViewModel: OCRViewModel
    @StateObject private var viewModel: CreateGroupViewModel
    @State private var stepHistory: [OCRStep] = []
    
    init(viewModel: CreateGroupViewModel, ocrViewModel: OCRViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.ocrViewModel = ocrViewModel
    }
    
    enum OCRStep {
        case photoPicker
        case scan
        case result
        case info
        
        var progress: CGFloat {
            switch self {
            case .photoPicker: return 0.2
            case .scan: return 0.4
            case .result: return 0.6
            case .info: return 0.8
            }
        }
    }
    
    @State private var currentStep: OCRStep = .photoPicker {
        didSet {
            if let last = stepHistory.last, last == currentStep {
                stepHistory.removeLast()
            } else {
                stepHistory.append(oldValue)
            }
        }
    }
    
    var body: some View {
        VStack {
            switch currentStep {
            case .photoPicker:
                PhotoPickerView(
                    viewModel: viewModel,
                    ocrViewModel: ocrViewModel,
                    onBack: handleBack
                )
            case .scan:
                if let image = ocrViewModel.selectedImage {
                    PhotoScanView(image: image) {
                        currentStep = .result
                    }
                }
            case .result:
                OCRResultView(
                    viewModel: viewModel,
                    ocrViewModel: ocrViewModel,
                    currentStep: $currentStep,
                    onNext: {currentStep = .info},
                    onBack: handleBack
                )
            case .info:
                MyinfoView(
                    currentStep: $currentStep,
                    viewModel: viewModel,
                    onBack: handleBack
                )
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
    private func handleBack() {
        if currentStep == .result {
            // result -> photoPicker로 바로 이동
            currentStep = .photoPicker
            stepHistory.removeAll() // 히스토리 리셋도 가능
        } else if let last = stepHistory.popLast() {
            currentStep = last
        } else {
            viewModel.coordinator.pop()
        }
    }
}
