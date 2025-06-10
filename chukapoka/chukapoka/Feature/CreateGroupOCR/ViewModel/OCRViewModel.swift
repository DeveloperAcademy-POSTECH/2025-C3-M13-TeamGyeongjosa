import SwiftUI
import PhotosUI
import Vision
import UIKit

@MainActor
class OCRViewModel: ObservableObject {
    
    struct OCRParseResult {
        var place: String?
        var date: String?
        var time: String?
        var brideName: String?
        var bank: String?
        var accountNumber: String?
    }
    
    let coordinator: AppCoordinator

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    private let textClassifier = TextClassifier()

    var ocrResult: OCRResult? {
        textClassifier.classify(recognizedTextLines)
    }
    
    @Published var selectedItem: PhotosPickerItem?
    @Published var selectedImage: UIImage?
    @Published var recognizedTextLines: [String] = []
    
    func reset() {
        selectedImage = nil
        selectedItem = nil
        recognizedTextLines = []
    }

    private let ocrManager = OCRManager()

    // MARK: - 이미지 선택 후 OCR 처리
    func handleImageSelection(from item: PhotosPickerItem, completion: @escaping () -> Void) {
        Task {
            do {
                if let data = try await item.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    self.selectedImage = image

                    // OCRManager도 async 버전으로 되어 있어야 함
                    let lines = await ocrManager.recognizeText(from: image)
                    self.recognizedTextLines = lines
                    completion()
                }
            } catch {
                print("이미지 로딩 실패: \(error.localizedDescription)")
                completion()
            }
        }
    }
}
