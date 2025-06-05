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
        @Attribute(.unique) var weddingID: Int
        var place: String
        var date: Date
        var time: Date
        var accountName: String
        var accountNumber: Int

        // 관계: Wedding ⟶ Party (1:N)
        @Relationship(deleteRule: .cascade) var parties: [Party] = []

        init(
            weddingID: Int,
            place: String,
            date: Date,
            time: Date,
            accountName: String,
            accountNumber: Int
        ) {
            self.weddingID = weddingID
            self.place = place
            self.date = date
            self.time = time
            self.accountName = accountName
            self.accountNumber = accountNumber
        }
}
