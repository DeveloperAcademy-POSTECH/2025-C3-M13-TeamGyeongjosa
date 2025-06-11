//
//  MarriedCoupleViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/11/25.
//
import SwiftUI

@MainActor
final class MarriedCoupleViewModel: ObservableObject {
    let coordinator: AppCoordinator
    let wedding: Wedding
    @Published var parties: [Party] = []
    
    init(coordinator: AppCoordinator, wedding: Wedding) {
        self.coordinator = coordinator
        self.wedding = wedding
        self.parties = wedding.parties.sorted { $0.name < $1.name }
    }
        
        func goBack() {
            coordinator.pop()
        }
        
        func goToReceiveCardList(party: Party) {
            coordinator.push(.receiveCardList(party: party))
        }
        
    }
