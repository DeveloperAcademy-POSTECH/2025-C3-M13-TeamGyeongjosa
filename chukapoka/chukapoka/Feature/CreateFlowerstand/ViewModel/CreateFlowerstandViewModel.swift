//
//  CreateFlowerstandViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/5/25.
//
import SwiftUI
import SwiftData

@MainActor
final class CreateFlowerstandViewModel: ObservableObject {
    
    private let coordinator: AppCoordinator
    
    @Published private(set) var leader: PartyMember?
    
    init(coordinator: AppCoordinator, leader: PartyMember) {
        self.coordinator = coordinator
        self.leader = leader
        self.recipientName = leader.name
        
        bindStepViewModels()
    }
    
    enum Step: Int, CaseIterable, Identifiable {
        case amount
        case decorate
        case message
        case complete
        
        var id: Int { rawValue }
    }
    
    @Published var step: Step = .amount
    
    // 각 스텝별 ViewModel UI 상태만 가짐
    @Published var step1ViewModel = FlowerStandStep1ViewModel()
    @Published var step2ViewModel = FlowerStandStep2ViewModel()
    @Published var step3ViewModel = FlowerStandStep3ViewModel()
    
    // 각 step별 입력값 통합 ( 하위 ViewModel에서 바인딩됨 )
    @Published var amount: Int?
    @Published var recipientName: String = ""
    @Published var selectedColor: Color = GSColor.yellow
    @Published var selectedFlower: String = ""
    @Published var message: String = ""
    
    private func bindStepViewModels() {
        step1ViewModel.$amountText
            .map { Int($0.filter(\.isNumber)) }
            .assign(to: &$amount)
        
        //        step1ViewModel.$recipientName
        //            .assign(to: &$recipientName)
        
        step2ViewModel.$selectedColor
            .assign(to: &$selectedColor)
        
        step2ViewModel.$selectedFlower
            .assign(to: &$selectedFlower)
        
        step3ViewModel.$message
            .assign(to: &$message)
    }
    
    var nextButtonTitle: String {
        step == .complete ? "화환 만들기" : "다음"
    }
    
    func goNext(modelContext: ModelContext) {
        switch step {
        case .complete:
            // Step4까지 끝나면, 새로운 화면 (Finish/로딩)으로 네비게이션
            saveFlowerstandInfo(modelContext: modelContext)
            coordinator.push(.loadingFlowerstandDone)
        default:
            if let next = Step(rawValue: step.rawValue + 1) {
                step = next
            }
        }
    }
    
    func goBack() {
        switch step {
        case .amount:
            // 첫 단계면 뒤로 나가야 함 (아에 첨으로 새로 데이터 넣어야함)
            coordinator.popToRoot()
        default:
            // 나머지는 이전 단계로 이동
            if let prev = Step(rawValue: step.rawValue - 1) {
                step = prev
            }
        }
    }
    
    var isNextEnabled: Bool {
        switch step {
        case .amount:
            return step1ViewModel.isValid
        case .decorate:
            return step2ViewModel.isValid
        case .message:
            return step3ViewModel.isValid
        default:
            return true
        }
    }
    
    var partyName: String {
        leader?.party?.name ?? "알 수 없음"
    }
    
    func saveFlowerstandInfo(modelContext: ModelContext) {
        guard let leader else {
            print("error: 리더가 존재하지않음")
            return
        }
        
        if let amount = self.amount {
            leader.money = amount
        }
        
        leader.message = self.message
        leader.flowerstandPath = generateFlowerstandPath(flower: selectedFlower, color: selectedColor)
        
        do {
            try modelContext.save()
            print("✅ 화환 정보 저장됨: \(leader.name), 금액=\(leader.money!), 메시지=\(leader.message), path=\(leader.flowerstandPath)")
        } catch {
            print("저장 실패: \(error.localizedDescription)")
        }
    }
    
    func generateFlowerstandPath(flower: String, color: Color) -> String {
        let colorName: String
        
        switch color {
        case GSColor.yellow:
            colorName = "Yellow"
        case GSColor.pink:
            colorName = "Pink"
        case GSColor.purple:
            colorName = "Purple"
        default:
            colorName = "Yellow"
        }
        return "\(flower)_\(colorName)"
    }
}
