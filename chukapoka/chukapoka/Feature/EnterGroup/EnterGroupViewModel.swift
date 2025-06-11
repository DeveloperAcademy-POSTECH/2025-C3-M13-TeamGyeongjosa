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
    @Published var joinedParty: Party?
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
        
        // 신부 코드
        
        let trimmedCode = code.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        guard trimmedCode.count == 6 else {
            isCodeValid = false
            isCodeMatched = true
            print("코드가 6자리가 아닙니다.")
            return
        }
        
        if trimmedCode.hasPrefix("BB") {
            let weddingDescriptor = FetchDescriptor<Wedding>(
                predicate: #Predicate { $0.brideInviteCode == trimmedCode }
            )
            do {
                let weddings = try modelContext.fetch(weddingDescriptor)
                if let wedding = weddings.first {
                    coordinator.push(.marriedCouple(wedding: wedding))
                } else {
                    isCodeValid = true
                    isCodeMatched = false
                    print("일치하는 신부 초대 코드가 없어요.")
                }
            } catch {
                isCodeValid = false
                isCodeMatched = false
                print("Wedding fetch 실패: \(error)")
            }
            return
        }
        
        // 일반 초대 코드인경우
        
        let partyDescriptor = FetchDescriptor<Party>(
            predicate: #Predicate { $0.inviteCode == trimmedCode }
        )
        do {
            let parties = try modelContext.fetch(partyDescriptor)
            if let party = parties.first {
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
