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
        case .dDay(let days): return days == 0 ? "오늘" : "D-\(days)"
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
    
    static func from(date: Date) -> PartyCardState {
        let today = Calendar.current.startOfDay(for: Date())
        let target = Calendar.current.startOfDay(for: date)
        let diff = Calendar.current.dateComponents([.day], from: today, to: target).day ?? 0
        return diff < 0 ? .archived : .dDay(diff)
    }
}
