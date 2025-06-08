////
////  OCRManager.swift
////  chukapoka
////
////  Created by jenki on 6/7/25.
////
//
//import UIKit
//import Vision
//
//class OCRManager {
//    func recognizeText(from image: UIImage, completion: @escaping ([String]) -> Void) {
//        guard let cgImage = image.cgImage else {
//            print("CGImage 변환 실패")
//            completion([])
//            return
//        }
//
//        let request = VNRecognizeTextRequest { request, error in
//            if let error = error {
//                print("OCR 에러: \(error.localizedDescription)")
//                completion([])
//                return
//            }
//
//            let observations = request.results as? [VNRecognizedTextObservation] ?? []
//            let texts = observations.compactMap { $0.topCandidates(1).first?.string }
//            print("OCR 결과: \(texts)")
//            completion(texts)
//        }
//
//        request.recognitionLanguages = ["ko-KR", "en-US"]
//        request.recognitionLevel = .accurate
//
//        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
//        do {
//            try handler.perform([request])
//        } catch {
//            print("OCR 처리 중 오류: \(error.localizedDescription)")
//            completion([])
//        }
//    }
//}


// OCRManager.swift
import UIKit
import Vision

class OCRManager {
    func recognizeText(from image: UIImage) async -> [String] {
        guard let cgImage = image.cgImage else {
            print("CGImage 변환 실패")
            return []
        }

        return await withCheckedContinuation { continuation in
            let request = VNRecognizeTextRequest { request, error in
                if let error = error {
                    print("OCR 에러: \(error)")
                    continuation.resume(returning: [])
                    return
                }

                let texts = (request.results as? [VNRecognizedTextObservation])?
                    .compactMap { $0.topCandidates(1).first?.string } ?? []

                continuation.resume(returning: texts)
            }

            request.recognitionLanguages = ["ko-KR", "en-US"]
            request.recognitionLevel = .accurate

            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try handler.perform([request])
            } catch {
                print("OCR 실행 에러: \(error)")
                continuation.resume(returning: [])
            }
        }
    }
}
