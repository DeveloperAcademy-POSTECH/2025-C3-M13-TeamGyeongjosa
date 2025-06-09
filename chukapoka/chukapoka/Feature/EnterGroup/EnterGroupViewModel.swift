//
//  EnterGroupViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI
import SwiftData

@MainActor
final class EnterGroupViewModel: ObservableObject {
    enum Step {
        case inputCode
        case nameCheck
    }
    
    @Published var step: Step = .inputCode
    @Published var code: String =  ""
    @Published var isCodeValid: Bool = false
    @Published var teamName: String = ""
    
    let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func goBack() {
        switch step {
        case .inputCode:
            coordinator.pop()
        case .nameCheck:
            step = .inputCode
        }
    }
    
    func validateAndFetchParty(modelContext: ModelContext) {
        guard code.count == 6 else {
            isCodeValid = false
            return print("코드가 6자리가 아닙니다.")
        }
        
        let descriptor = FetchDescriptor<Party>(
            predicate: #Predicate { $0.inviteCode == code
            })
        do {
            let result = try modelContext.fetch(descriptor)
            if let party = result.first {
                self.teamName = party.name
                self.isCodeValid = true
                self.step = .nameCheck
            } else {
                self.isCodeValid = false
            }
        } catch {
            print("Party data fetching error: \(error)")
            self.isCodeValid = false
        }
    }
    
    func goNext() {
        coordinator.push(.joinGroupStep2)
    }
}
