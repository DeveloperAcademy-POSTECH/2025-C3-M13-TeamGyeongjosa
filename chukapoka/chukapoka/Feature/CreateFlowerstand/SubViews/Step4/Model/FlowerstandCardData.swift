//
//  FlowerstandCardData.swift
//  chukapoka
//
//  Created by 조유진 on 6/6/25.
//

import Foundation
import SwiftUI

struct FlowerstandCardData: Equatable, Identifiable {
    let id: UUID = UUID()
    var name: String
    var selectedColor: Color
    var selectedFlower: String
    var partyName: String
    var ribbonText: String
}
