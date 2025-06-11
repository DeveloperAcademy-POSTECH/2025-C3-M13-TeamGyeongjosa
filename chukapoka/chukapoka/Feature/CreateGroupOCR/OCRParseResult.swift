//
//  OCRParseResult.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//

import Foundation

struct OCRParseResult {
    var place: String?
    var date: String?
    var time: String?
    var brideName: String?
    var bank: String?
    var accountNumber: String?
}

extension OCRParseResult {
    init(from result: OCRResult) {
        self.place = result.place
        self.date = result.date
        self.time = result.time
        self.brideName = result.brideName
        self.bank = result.bank
        self.accountNumber = result.accountNumber
    }
}
