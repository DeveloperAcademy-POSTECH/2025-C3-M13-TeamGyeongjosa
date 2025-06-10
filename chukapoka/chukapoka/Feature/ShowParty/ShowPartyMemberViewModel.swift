//
//  ShowPartyMemberViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//
import SwiftUI
import Foundation

@MainActor
final class ShowPartyMemberViewModel: ObservableObject {
    @Published var members: [PartyMember] = []
    @Published var selectedMember: PartyMember?
    
    let partyName: String
    let coordinator: AppCoordinator
    
    var leader: PartyMember? {
        members.first(where: { $0.isLeader })
    }
    
    var participants: [PartyMember] {
        members.filter { !$0.isLeader }
    }
    
    init(coordinator: AppCoordinator, party: Party) {
        self.coordinator = coordinator
        self.partyName = party.name
        self.members = sortMembers(party.members)
    }
    
    private func sortMembers(_ members: [PartyMember]) -> [PartyMember] {
        return members.sorted {
            if $0.isLeader != $1.isLeader {
                return $0.isLeader && !$1.isLeader
            } else {
                return $0.name < $1.name
            }
        }
    }
    
    func goBack() {
        coordinator.pop()
    }
    
    func membersWithoutMoney() -> (leader: PartyMember?, participants: [PartyMember]) {
        let leader = self.leader.map { member in
            PartyMember(
                isLeader: member.isLeader,
                name: member.name,
                accountNumber: member.accountNumber,
                phoneNumber: member.phoneNumber,
                money: nil,
                message: member.message,
                flowerstandPath: member.flowerstandPath
            )
        }
        
        let participants = self.participants.map { member in
            PartyMember(
                isLeader: member.isLeader,
                name: member.name,
                accountNumber: member.accountNumber,
                phoneNumber: member.phoneNumber,
                money: nil,
                message: member.message,
                flowerstandPath: member.flowerstandPath
            )
        }
        
        return (leader, participants)
    }
    
    func parseFlowerstandPath(_ path: String) -> (flower: String, color: Color) {
        let components = path.split(separator: "_")
        guard components.count == 2 else {
            return ("", GSColor.yellow)
        }
        
        let flower = String(components[0])
        let colorString = String(components[1])
        
        let color: Color
        switch colorString {
        case "Yellow":
            color = GSColor.yellow
        case "Pink":
            color = GSColor.pink
        case "Purple":
            color = GSColor.purple
        default:
            color = GSColor.yellow
        }
        
        return (flower, color)
    }
}
