//
//  OCRTextParser.swift
//  chukapoka
//
//  Created by jenki on 6/8/25.
//

import Foundation

struct OCRResult {
    var groomName: String?
    var brideName: String?
    var date: String?
    var place: String?
    var time: String?
}

class TextClassifier {
    func classify(_ lines: [String]) -> OCRResult {
        var result = OCRResult()

        for index in lines.indices {
            let line = lines[index].lowercased()

            // ✅ "and" 또는 "그리고"가 독립된 라인일 경우 → 전후 줄로 이름 추론
            if (line == "and" || line == "그리고"),
               index > 0, index + 1 < lines.count {
                let groomCandidate = lines[index - 1].trimmingCharacters(in: .whitespacesAndNewlines)
                let brideCandidate = lines[index + 1].trimmingCharacters(in: .whitespacesAndNewlines)
                print("🪄 'and' 탐지: 신랑 → \(groomCandidate), 신부 → \(brideCandidate)")
                result.groomName = groomCandidate
                result.brideName = brideCandidate
                continue
            }

            // 날짜 추출 및 포맷 변환
            if result.date == nil,
               let dateMatch = lines[index].range(of: #"\d{4}년 \d{1,2}월 \d{1,2}일"#, options: .regularExpression) {
                let rawDate = String(lines[index][dateMatch])
                result.date = formatKoreanDateString(rawDate)
            }

            // 장소 추출
            if result.place == nil,
               lines[index].contains("웨딩") || lines[index].contains("컨벤션") || lines[index].contains("호텔"),
               line.range(of: #"[^가-힣\s]"#, options: .regularExpression) == nil {
                result.place = lines[index]
            }

            // 키워드 기반 추출 (보조)
            if result.brideName == nil, lines[index].contains("신부") {
                result.brideName = lines[index]
            }
            if result.groomName == nil, lines[index].contains("신랑") {
                result.groomName = lines[index]
            }
            
            // 시간 추출
            if result.time == nil {
                if let timeMatch = lines[index].range(of: #"(오전|오후)\s?\d{1,2}시(?:\s?\d{1,2}분)?"#, options: .regularExpression) {
                    let rawTime = String(lines[index][timeMatch])
                    result.time = formatKoreanTimeString(rawTime)
                }
            }
            
        }

        print("📦 최종 결과: \(result)")
        return result
    }

    func formatKoreanDateString(_ koreanDate: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "ko_KR")
        inputFormatter.dateFormat = "yyyy년 M월 d일"

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy.MM.dd"

        if let date = inputFormatter.date(from: koreanDate) {
            return outputFormatter.string(from: date)
        } else {
            return nil
        }
    }
    
    func formatKoreanTimeString(_ koreanTime: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "ko_KR")
        inputFormatter.dateFormat = "a h시 m분"  // "오전 11시 30분" 등

        let fallbackFormatter = DateFormatter()
        fallbackFormatter.locale = Locale(identifier: "ko_KR")
        fallbackFormatter.dateFormat = "a h시"  // "오전 11시" 등

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "HH:mm"  // ✅ 최종 출력

        if let date = inputFormatter.date(from: koreanTime) {
            return outputFormatter.string(from: date)
        } else if let date = fallbackFormatter.date(from: koreanTime) {
            return outputFormatter.string(from: date)
        } else {
            return nil
        }
    }
}
