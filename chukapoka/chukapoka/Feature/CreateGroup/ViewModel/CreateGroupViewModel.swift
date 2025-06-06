//
//  GroupCreateViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

enum CreateGroupStep: Int, CaseIterable {
    case step1, step2, step3
}

@MainActor
final class CreateGroupViewModel: ObservableObject {
    var onComplete: (() -> Void)?
    
    @Published var currentStep: CreateGroupStep = .step1
    let coordinator: AppCoordinator
    
    // MARK: - Step 1
    @Published var partyName: String = ""
    @Published var isPartyNameValid: Bool = true
    
    @Published var weddingPlace: String = ""
    @Published var isPlaceValid: Bool = true
    
    @Published var weddingDate: String = ""
    @Published var isDateValid: Bool = true
    
    @Published var weddingTime: String = ""
    @Published var isTimeValid: Bool = true
    
    // MARK: - Step 2
    @Published var receiverName: String = ""
    @Published var isReceiverNameValid: Bool = true
    
    @Published var receiverAccount: String = ""
    @Published var isReceiverAccountValid: Bool = true
    
    // MARK: - Step 3
    @Published var senderName: String = ""
    @Published var isSenderNameValid: Bool = true
    
    @Published var senderAccount: String = ""
    @Published var isSenderAccountValid: Bool = true
    
    @Published var senderPhone: String = ""
    @Published var isSenderPhoneValid: Bool = true
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToNextStep() {
        guard let next = CreateGroupStep(rawValue: currentStep.rawValue + 1) else {
            return
        }
        
        currentStep = next
    }
    
    func goToPreviousStep() {
        guard currentStep != .step1 else {
            coordinator.pop()
            return
        }
        if let previous = CreateGroupStep(rawValue: currentStep.rawValue - 1) {
            currentStep = previous
        }
    }
    
    // MARK: - Step 1 Validation
    func validateStep1() -> Bool {
        isPartyNameValid = !partyName.isEmpty
        isPlaceValid = !weddingPlace.isEmpty
        isDateValid = weddingDate.count == 10
        isTimeValid = weddingTime.count == 5
        return isPartyNameValid && isPlaceValid && isDateValid && isTimeValid
    }
    
    func formatDateInput(_ input: String) -> String {
        let digits = input.filter { $0.isNumber }.prefix(8)
        var result = ""
        for (index, char) in digits.enumerated() {
            if index == 4 || index == 6 { result.append(".") }
            result.append(char)
        }
        return result
    }
    
    func formatTimeInput(_ input: String) -> String {
        let digits = input.filter { $0.isNumber }.prefix(4)
        var result = ""
        for (index, char) in digits.enumerated() {
            if index == 2 { result.append(":") }
            result.append(char)
        }
        return result
    }
    
    // MARK: - Step2 유효성 검사
    func validateStep2() -> Bool {
        isReceiverNameValid = isValidKoreanName(receiverName)
        isReceiverAccountValid = !receiverAccount.isEmpty
        return isReceiverNameValid && isReceiverAccountValid
    }
    
    private func isValidKoreanName(_ input: String) -> Bool {
        let regex = "^[가-힣]{2,5}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: input)
    }
    
    // MARK: - Step 3 Validation
    func validateStep3() -> Bool {
        isSenderNameValid = isValidKoreanName(senderName)
        isSenderAccountValid = !senderAccount.isEmpty
        isSenderPhoneValid = isValidPhone(senderPhone)
        return isSenderNameValid && isSenderAccountValid && isSenderPhoneValid
    }
    
    private func isValidPhone(_ input: String) -> Bool {
        let digitsOnly = input.filter { $0.isNumber }
        return digitsOnly.count == 11
    }
    
    func handleNext() {
        switch currentStep {
        case .step1:
            if validateStep1() {
                goToNextStep()
            }
        case .step2:
            if validateStep2() {
                goToNextStep()
            }
        case .step3:
            if validateStep3() {
                coordinator.push(.loadingInfoDone)
            }
        }
    }
    
    var isStep1Valid: Bool {
        !partyName.isEmpty ||
        !weddingPlace.isEmpty ||
        weddingDate.count == 10 ||
        weddingTime.count == 5
    }
    
    var isStep2Valid: Bool {
        isValidKoreanName(receiverName) ||
        !receiverAccount.isEmpty
    }
    
    var isStep3Valid: Bool {
        isValidKoreanName(senderName) ||
        !senderAccount.isEmpty ||
        isValidPhone(senderPhone)
    }
    
    var isNextButtonEnabled: Bool {
        switch currentStep {
        case .step1:
            return isStep1Valid
        case .step2:
            return isStep2Valid
        case .step3:
            return isStep3Valid
        }
    }
}

extension CreateGroupViewModel {
    var progressRate: CGFloat {
        let total = CGFloat(CreateGroupStep.allCases.count)
        let current = CGFloat(currentStep.rawValue + 1)
        return current / total
    }
    
    var nextButtonTitle: String {
        currentStep == .step3 ? "완료" : "다음"
    }
}
