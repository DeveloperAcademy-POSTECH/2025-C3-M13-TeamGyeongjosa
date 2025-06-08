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

            // MARK: - 신랑, 신부
            // 신부 이름 추출 (예: "신부 김민지" → "김민지")
            if result.brideName == nil,
               let brideRange = lines[index].range(of: "신부") {
                let afterBride = lines[index][brideRange.upperBound...]
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                if !afterBride.isEmpty {
                    result.brideName = afterBride
                    print("신부 이름 추출 \(afterBride)")
                }
            }
            // 신랑 이름 추출 (예: "신랑 이민수" → "이민수")
            if result.groomName == nil,
               let groomRange = lines[index].range(of: "신랑") {
                let afterGroom = lines[index][groomRange.upperBound...]
                    .trimmingCharacters(in: .whitespacesAndNewlines)
                if !afterGroom.isEmpty {
                    result.groomName = afterGroom
                    print("신랑 이름 추출 \(afterGroom)")
                }
            }
            // "and" 또는 "그리고"가 독립된 라인일 경우 → 전후 줄로 이름 추론
            if (line == "and" || line == "그리고"),
               index > 0, index + 1 < lines.count {
                let groomCandidate = lines[index - 1].trimmingCharacters(in: .whitespacesAndNewlines)
                let brideCandidate = lines[index + 1].trimmingCharacters(in: .whitespacesAndNewlines)
                print("🪄 'and' 탐지: 신랑 → \(groomCandidate), 신부 → \(brideCandidate)")
                result.groomName = groomCandidate
                result.brideName = brideCandidate
                continue
            }
            // MARK: - 날짜
            // 날짜 추출 및 포맷 변환
            if result.date == nil,
               let dateMatch = lines[index].range(of: #"\d{4}년 \d{1,2}월 \d{1,2}일"#, options: .regularExpression) {
                let rawDate = String(lines[index][dateMatch])
                result.date = formatKoreanDateString(rawDate)
            }
            // MARK: - 장소
            if result.place == nil,
               lines[index].contains("웨딩") || lines[index].contains("컨벤션") || lines[index].contains("호텔") {
                // 해당 라인에서 숫자 및 특수문자 제거 → 한글/영어/공백만 남김
                let filtered = lines[index].replacingOccurrences(
                    of: #"[^가-힣a-zA-Z0-9\s]"#,  // 숫자(0-9)도 허용
                    // of: #"[^가-힣a-zA-Z\s]"#,
                    with: "",
                    options: .regularExpression
                ).trimmingCharacters(in: .whitespacesAndNewlines)
                result.place = filtered
            }
            // MARK: - 날짜
            // 시간 추출
            if result.time == nil {
                if let timeMatch = lines[index].range(of: #"(오전|오후|AM|PM|am|pm)\s?\d{1,2}시(?:\s?\d{1,2}분)?"#, options: .regularExpression) {
                    let rawTime = String(lines[index][timeMatch])
                    result.time = formatKoreanTimeString(rawTime)
                }
            }
        }
        print("최종 결과: \(result)")
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
    
    func extractBrideName(from line: String) -> String? {
        guard let range = line.range(of: "신부") else { return nil }
        
        // "신부"라는 단어 뒤쪽 문자열 추출
        let afterKeyword = line[range.upperBound...]
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        // 특수문자, 숫자 등 제거 → 한글만 추출
        let cleaned = afterKeyword.replacingOccurrences(
            of: #"[^가-힣\s]"#, // 한글과 공백만 허용
            with: "",
            options: .regularExpression
        ).trimmingCharacters(in: .whitespacesAndNewlines)
        
        return cleaned.isEmpty ? nil : cleaned
    }
}
