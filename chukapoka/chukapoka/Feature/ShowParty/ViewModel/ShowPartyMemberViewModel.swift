//
//  ShowPartyMemberViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/10/25.
//
import SwiftUI

@MainActor
final class ShowPartyMemberViewModel: ObservableObject {
    
    let coordinator: AppCoordinator
    let party: Party
    
    @Published var members: [PartyMember] = []
    @Published var leader: PartyMember?
    
    init(coordinator: AppCoordinator, party: Party) {
        self.coordinator = coordinator
        self.party = party
        loadMembers()
    }
    
    func goBack() {
        coordinator.pop()
    }
    
    private func loadMembers() {
        leader = party.members.first(where: { $0.isLeader })
        members = party.members.filter { !$0.isLeader }
    }
    
    func flowerstandCardItem(for member: PartyMember) -> FlowerstandCardItem {
        let components = member.flowerstandPath.split(separator: "_").map { String($0) }
        let flowerName = components.first ?? "RedFlower"
        let colorName = components.count > 1 ? components[1] : "Yellow"
        
        return FlowerstandCardItem(
            name: member.name,
            backgroundColor: colorForName(colorName),
            imagePath: flowerName
        )
    }
    
    private func colorForName(_ name: String) -> Color {
        switch name {
        case "Yellow": return GSColor.yellow
        case "Pink": return GSColor.pink
        case "Purple": return GSColor.purple
        default: return GSColor.yellow
        }
    }
}
