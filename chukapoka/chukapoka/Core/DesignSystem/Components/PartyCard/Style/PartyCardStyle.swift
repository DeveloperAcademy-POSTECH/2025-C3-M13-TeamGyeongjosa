//
//  PartyCard+Style.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/4/25.
//

import SwiftUI

enum PartyCardState {
    case dDay(Int)
    case archived
    
    var badgeText: String {
        switch self {
        case .dDay(let days): return "D-\(days)"
        case .archived: return "완료"
        }
    }
    
    var textColor: Color {
        switch self {
        case .dDay: return GSColor.white
        case .archived: return GSColor.white
        }
    }
    
    var badgeColor: Color {
        switch self {
        case .dDay: return GSColor.primary
        case .archived: return GSColor.gray2
        }
    }
    
    var isAvailalbeInvite: Bool {
        switch self {
        case .dDay: return true
        case .archived: return false
        }
    }
}
