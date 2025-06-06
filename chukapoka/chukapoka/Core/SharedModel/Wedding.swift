//
//  Wedding.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//

import Foundation
import SwiftData

@Model
final class Wedding {
    @Attribute(.unique)
    var weddingID: UUID
    var place: String
    var date: Date
    var accountName: String
    var accountNumber: String
    
    // 관계: Wedding ⟶ Party (1:N)
    @Relationship(deleteRule: .cascade)
    var parties: [Party] = []
    
    init(
        weddingID: UUID = UUID(),
        place: String,
        date: Date,
        accountName: String,
        accountNumber: String
    ) {
        self.weddingID = weddingID
        self.place = place
        self.date = date
        self.accountName = accountName
        self.accountNumber = accountNumber
    }
}
