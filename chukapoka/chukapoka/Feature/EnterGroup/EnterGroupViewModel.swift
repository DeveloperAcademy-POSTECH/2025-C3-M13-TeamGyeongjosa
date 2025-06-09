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
    @Published var joinedParty: Party? = nil
    @Published var isCodeMatched: Bool = true
    
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
            isCodeMatched = true
            return print("코드가 6자리가 아닙니다.")
        }
        
        let descriptor = FetchDescriptor<Party>(
            predicate: #Predicate { $0.inviteCode == code
            })
        do {
            let result = try modelContext.fetch(descriptor)
            if let party = result.first {
                self.teamName = party.name
                self.joinedParty = party
                self.isCodeValid = true
                self.step = .nameCheck
            } else {
                self.isCodeValid = true
                self.isCodeMatched = false
                print("일치하는 파티가 없어요.")
            }
        } catch {
            print("Party data fetching error: \(error)")
            self.isCodeValid = false
            self.isCodeMatched = false
        }
    }
    
    func goNext() {
        guard let party = joinedParty else {
            print("error: 파티 정보 없음")
            return
        }
        coordinator.push(.joinGroupStep2(party: party))
    }
}
