//
//  OCRTextParser.swift
//  chukapoka
//
//  Created by jenki on 6/8/25.
//

struct OCRResult {
    var groomName: String?
    var brideName: String?
    var date: String?
    var place: String?
}

class TextClassifier {
    func classify(_ lines: [String]) -> OCRResult {
        var result = OCRResult()

        for index in lines.indices {
            let line = lines[index].lowercased()

            // ✅ "and"가 독립된 라인일 경우 → 전후 줄로 이름 추론 그리고도 추가
            if line == "and",
               index > 0, index + 1 < lines.count {
                let groomCandidate = lines[index - 1].trimmingCharacters(in: .whitespacesAndNewlines)
                let brideCandidate = lines[index + 1].trimmingCharacters(in: .whitespacesAndNewlines)
                result.groomName = groomCandidate
                result.brideName = brideCandidate
                continue
            }

            // 날짜 추출
            if result.date == nil,
               let dateMatch = lines[index].range(of: #"\d{4}년 \d{1,2}월 \d{1,2}일"#, options: .regularExpression) {
                result.date = String(lines[index][dateMatch])
            }

            // 장소 추출
            if result.place == nil,
               lines[index].contains("웨딩") || lines[index].contains("컨벤션") || lines[index].contains("호텔") {
                result.place = lines[index]
            }

            // 키워드 기반 추출 (보조)
            if result.brideName == nil, lines[index].contains("신부") {
                result.brideName = lines[index]
            }
            if result.groomName == nil, lines[index].contains("신랑") {
                result.groomName = lines[index]
            }
        }
        return result
    }
}
