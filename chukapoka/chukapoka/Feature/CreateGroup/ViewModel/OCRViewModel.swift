import SwiftUI
import PhotosUI
import Vision
import UIKit

@MainActor
class OCRViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem?
    @Published var selectedImage: UIImage?
    @Published var recognizedTextLines: [String] = []

    private let ocrManager = OCRManager()

    // MARK: - 이미지 선택 후 OCR 처리
    func handleImageSelection(from item: PhotosPickerItem, completion: @escaping () -> Void) {
        Task {
            do {
                // 이미지 데이터 가져오기
                if let data = try await item.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    self.selectedImage = image

                    // OCR 실행
                    ocrManager.recognizeText(from: image) { [weak self] lines in
                        DispatchQueue.main.async {
                            self?.recognizedTextLines = lines
                            completion()
                        }
                    }
                }
            } catch {
                print("이미지 로딩 실패: \(error.localizedDescription)")
                completion()
            }
        }
    }
}
