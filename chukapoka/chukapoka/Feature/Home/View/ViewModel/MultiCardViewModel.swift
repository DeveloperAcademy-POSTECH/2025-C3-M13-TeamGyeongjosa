//
//  CardViewStateModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import Foundation
import SwiftData

final class MultiCardViewModel {
    
    func opacity(for index: Int, current: Int) -> Double {
        return index == current ? 1.0 : 0.6
    }
    
    func scale(for index: Int, current: Int) -> CGFloat {
        return index == current ? 1.0 : 0.98
    }
    
    func deleteParty(_ party: Party, context: ModelContext) {
        context.delete(party)
        try? context.save()
    }
    
}
