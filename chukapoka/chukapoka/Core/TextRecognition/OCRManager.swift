//
//  OCRManager.swift
//  chukapoka
//
//  Created by jenki on 6/7/25.
//

import UIKit
import Vision

class OCRManager {
    func recognizeText(from image: UIImage, completion: @escaping ([String]) -> Void) {
        guard let cgImage = image.cgImage else {
            print("OCR 실패: UIImage -> CGImage로 변환 실패")
            completion([])
            return
        }

        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print("OCR 요청 처리 중 에러 발생: \(error.localizedDescription)")
                completion([])
                return
            }

            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                print("OCR 결과 VNRecognizedTextObservation으로 캐스팅 실패")
                completion([])
                return
            }

            let texts = observations.compactMap { $0.topCandidates(1).first?.string }
            print("OCR 인식된 텍스트 라인들: \(texts)")
            completion(texts)
        }

        request.recognitionLanguages = ["ko-KR", "en-US"]
        request.recognitionLevel = .accurate

        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        do {
            try handler.perform([request])
        } catch {
            print("OCR 실행 중 예외 발생: \(error.localizedDescription)")
            completion([])
        }
    }
}
