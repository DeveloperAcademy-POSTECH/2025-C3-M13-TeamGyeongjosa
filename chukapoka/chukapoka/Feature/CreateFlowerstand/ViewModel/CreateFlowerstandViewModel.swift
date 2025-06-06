//
//  CreateFlowerstandViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/5/25.
//
import SwiftUI

@MainActor
final class CreateFlowerstandViewModel: ObservableObject {
    
    enum Step: Int, CaseIterable, Identifiable {
        case amount
        case decorate
        case message
        case complete
        case loading
        
        var id: Int { rawValue }
    }
    
    @Published var step: Step = .amount
    
    // 각 스텝별 ViewModel UI 상태만 가짐
    @Published var step1ViewModel = FlowerStandStep1ViewModel()
    @Published var step2ViewModel = FlowerStandStep2ViewModel()
    @Published var step3ViewModel = FlowerStandStep3ViewModel()
    
    // 각 step별 입력값 통합 ( 하위 ViewModel에서 바인딩됨 )
    @Published var amount: Int?
    @Published var recipientName: String = "지수"
    @Published var selectedColor: Color = GSColor.yellow
    @Published var selectedFlower: String = ""
    @Published var message: String = ""
    
    init() {
        bindStepViewModels()
    }
    
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
    
    func goNext(coordinator: AppCoordinator) {
        switch step {
        case .complete:
            // Step4까지 끝나면, 새로운 화면 (Finish/로딩)으로 네비게이션
            coordinator.push(.loadingInfoDone)
        default:
            if let next = Step(rawValue: step.rawValue + 1) {
                step = next
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
}
