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
    var bank: String?
    var accountNumber: String?
}

class TextClassifier {
    func classify(_ lines: [String]) -> OCRResult {
        var result = OCRResult()
        
        for index in lines.indices {
            let line = lines[index].lowercased()
            
            // MARK: - 신랑/신부 이름 추출
            if result.brideName == nil,
               let name = extractName(from: lines[index], keyword: "신부") {
                result.brideName = name
            }
            if result.groomName == nil,
               let name = extractName(from: lines[index], keyword: "신랑") {
                result.groomName = name
            }
            
            // 'and' 혹은 '그리고'가 단독일 경우 앞뒤 줄에서 추정
            if (line == "and" || line == "그리고"),
               index > 0, index + 1 < lines.count {
                result.groomName = lines[index - 1].trimmingCharacters(in: .whitespacesAndNewlines)
                result.brideName = lines[index + 1].trimmingCharacters(in: .whitespacesAndNewlines)
            }
            
            // MARK: - 날짜
            if result.date == nil,
               let dateMatch = lines[index].range(of: #"\d{4}년 \d{1,2}월 \d{1,2}일"#, options: .regularExpression) {
                let rawDate = String(lines[index][dateMatch])
                result.date = formatKoreanDateString(rawDate)
            }
            
            // MARK: - 시간
            if result.time == nil,
               let timeMatch = lines[index].range(of: #"(오전|오후|AM|PM|am|pm)\s?\d{1,2}시(?:\s?\d{1,2}분)?"#, options: .regularExpression) {
                let rawTime = String(lines[index][timeMatch])
                result.time = formatKoreanTimeString(rawTime)
            }
            
            // MARK: - 장소
            if result.place == nil,
               lines[index].contains("웨딩") || lines[index].contains("컨벤션") || lines[index].contains("호텔") {
                var placeLine = lines[index]
                if let start = placeLine.first, start.isNumber { placeLine.removeFirst() }
                if let end = placeLine.last, end.isNumber { placeLine.removeLast() }
                let filtered = placeLine.replacingOccurrences(
                    of: #"[^가-힣a-zA-Z0-9\s]"#,
                    with: "",
                    options: .regularExpression
                ).trimmingCharacters(in: .whitespacesAndNewlines)
                result.place = filtered
            }
            
            // MARK: - 은행 및 계좌번호
            if (result.bank == nil || result.accountNumber == nil),
               lines[index].contains("은행") {
                let trimmedLine = lines[index].trimmingCharacters(in: .whitespacesAndNewlines)
                result.bank = extractBankName(from: trimmedLine)
                
                // 계좌번호는 같은 줄 또는 다음 줄에서 추출
                if let accountNumber = extractAccountNumber(from: trimmedLine) {
                    result.accountNumber = accountNumber
                } else if index + 1 < lines.count {
                    result.accountNumber = extractAccountNumber(from: lines[index + 1])
                }
            }
        }
        
        print("최종 결과: \(result)")
        return result
    }
    
    // MARK: - 날짜 포맷
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
    
    // MARK: - 시간 포맷
    func formatKoreanTimeString(_ koreanTime: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "ko_KR")
        inputFormatter.dateFormat = "a h시 m분"
        
        let fallbackFormatter = DateFormatter()
        fallbackFormatter.locale = Locale(identifier: "ko_KR")
        fallbackFormatter.dateFormat = "a h시"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "HH:mm"
        
        if let date = inputFormatter.date(from: koreanTime) {
            return outputFormatter.string(from: date)
        } else if let date = fallbackFormatter.date(from: koreanTime) {
            return outputFormatter.string(from: date)
        } else {
            return nil
        }
    }
    
    // MARK: - 이름 추출
    func extractName(from line: String, keyword: String) -> String? {
        guard let range = line.range(of: keyword) else { return nil }
        let afterKeyword = line[range.upperBound...]
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let cleaned = afterKeyword.replacingOccurrences(
            of: #"[^가-힣\s]"#,
            with: "",
            options: .regularExpression
        ).trimmingCharacters(in: .whitespacesAndNewlines)
        return cleaned.isEmpty ? nil : cleaned
    }
    
    // MARK: - 은행 이름 추출
    func extractBankName(from line: String) -> String? {
        do {
            let regex = try NSRegularExpression(pattern: #"[가-힣]+은행"#)
            if let match = regex.firstMatch(in: line, range: NSRange(line.startIndex..., in: line)) {
                let bankName = String(line[Range(match.range, in: line)!])
                return bankName
            }
        } catch {
            print("Regex error in extractBankName: \(error.localizedDescription)")
        }
        return nil
    }
    
    // MARK: - 계좌번호 추출
    func extractAccountNumber(from line: String) -> String? {
        do {
            let regex = try NSRegularExpression(pattern: #"[0-9]{2,5}[-\s]?[0-9]{2,6}[-\s]?[0-9]{2,6}"#)
            if let match = regex.firstMatch(in: line, range: NSRange(line.startIndex..., in: line)) {
                return String(line[Range(match.range, in: line)!])
            }
        } catch {
            print("Regex error in extractAccountNumber: \(error.localizedDescription)")
        }
        return nil
    }
}
