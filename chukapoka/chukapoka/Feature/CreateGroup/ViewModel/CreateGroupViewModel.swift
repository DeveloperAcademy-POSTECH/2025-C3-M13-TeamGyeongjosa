//
//  GroupCreateViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI
import SwiftData

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
    
    @Published var receiverBank: String = "" // 은행
    @Published var isReceiverBankValid: Bool = true
    
    @Published var receiverAccount: String = "" // 계좌번호
    @Published var isReceiverAccountValid: Bool = true
    
    // MARK: - Step 3
    @Published var senderName: String = ""
    @Published var isSenderNameValid: Bool = true
    
    @Published var senderBank: String = "" // 은행
    @Published var isSenderBankValid: Bool = true
    
    @Published var senderAccount: String = "" // 계좌번호
    @Published var isSenderAccountValid: Bool = true
    
    @Published var senderPhoneNumber: String = ""
    @Published var isSenderPhoneNumberValid: Bool = true
    
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
    
    func isValidKoreanName(_ input: String) -> Bool {
        let regex = "^[가-힣]{2,10}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: input)
    }
    
    func isValidAccountNumber(_ input: String) -> Bool {
        let digitsOnly = input.filter { $0.isNumber }
        return digitsOnly.count >= 11 && digitsOnly.count <= 14
    }
    
    func isValidPhoneNumber(_ input: String) -> Bool {
        let digitsOnly = input.filter { $0.isNumber }
        return digitsOnly.count == 11
    }
    
    func formatPhoneNumberInput(_ input: String) -> String {
        let digits = input.filter { $0.isNumber }.prefix(11)
        var result = ""
        for (index, char) in digits.enumerated() {
            if index == 3 || index == 7 { result.append("-") }
            result.append(char)
        }
        return result
    }
    
    // MARK: - Step 1 Validation
    func validateStep1() -> Bool {
        isPartyNameValid = !partyName.isEmpty && partyName.count <= 10
        isPlaceValid = !weddingPlace.isEmpty && weddingPlace.count <= 20
        isDateValid = !weddingDate.isEmpty && weddingDate.count == 10
        isTimeValid = !weddingTime.isEmpty && weddingTime.count == 5
        return isPartyNameValid && isPlaceValid && isDateValid && isTimeValid
    }
    
    // MARK: - Step2 Validation
    func validateStep2() -> Bool {
        isReceiverNameValid = isValidKoreanName(receiverName)
        isReceiverBankValid = isValidKoreanName(receiverBank)
        isReceiverAccountValid = isValidAccountNumber(receiverAccount)
        return isReceiverNameValid && isReceiverBankValid && isReceiverAccountValid
    }
    
    // MARK: - Step 3 Validation
    func validateStep3() -> Bool {
        isSenderNameValid = isValidKoreanName(senderName)
        isSenderBankValid = isValidKoreanName(senderBank)
        isSenderAccountValid = isValidAccountNumber(senderAccount)
        isSenderPhoneNumberValid = isValidPhoneNumber(senderPhoneNumber)
        return isSenderNameValid && isSenderAccountValid && isSenderPhoneNumberValid
    }
    
    func handleNext(modelContext: ModelContext) {
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
                let leader = saveGroupData(modelContext: modelContext)
                coordinator.push(.loadingInfoDone(leader: leader))
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
        !receiverBank.isEmpty ||
        !receiverAccount.isEmpty
    }
    
    var isStep3Valid: Bool {
        isValidKoreanName(senderName) ||
        !senderAccount.isEmpty ||
        isValidPhoneNumber(senderPhoneNumber)
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
    
    // SwiftData 저장
    func saveGroupData(modelContext: ModelContext) -> PartyMember {
        
        let partyCode = generatePartyInviteCode()
        let brideCode = generateBrideInviteCode()
        
        let formatter = DateFormatter()
        formatter.timeZone = .current
        let dateTime: Date
        
        if !weddingTime.isEmpty {
            formatter.dateFormat = "yyyy.MM.dd HH:mm"
            dateTime = formatter.date(from: "\(weddingDate) \(weddingTime)") ?? Date()
        } else {
            formatter.dateFormat = "yyyy.MM.dd"
            dateTime = formatter.date(from: weddingDate) ?? Date()
        }
        
        let wedding = Wedding(
            place: weddingPlace,
            date: dateTime,
            accountName: receiverName,
            accountNumber: receiverBank + " " + receiverAccount,
            brideInviteCode: brideCode
        )
        modelContext.insert(wedding)
        print("✅ Wedding 저장됨: place=\(wedding.place), date=\(wedding.date), name=\(wedding.accountName), number=\(wedding.accountNumber), 신부코드=\(wedding.brideInviteCode)")
        
        let party = Party(
            name: partyName,
            photoPath: "",
            wedding: wedding,
            inviteCode: partyCode
        )
        modelContext.insert(party)
        print("✅ Party 저장됨: name=\(party.name), photoPath=\(party.photoPath), wedding=\(party.wedding?.place ?? "nil"), 파티코드 = \(party.inviteCode)")
        
        let leader = PartyMember(
            isLeader: true,
            name: senderName,
            accountNumber: senderBank + " " + senderAccount,
            phoneNumber: senderPhoneNumber,
            money: 0,
            message: "",
            flowerstandPath: "",
            party: party
        )
        modelContext.insert(leader)
        print("✅ Leader 저장됨: name=\(leader.name), phone=\(leader.phoneNumber), account=\(leader.accountNumber), party=\(leader.party?.name ?? "nil")")
        
        print("Leader 저장됨: name=\(leader.name)")
        return leader
    }
    
    // 모임 초대코드 생성 -> 랜덤값
    private func generatePartyInviteCode() -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        return "G" + String((0..<5).map { _ in letters.randomElement()! })
    }
    
    // 신부 모임코드 생성 -> 랜덤값
    private func generateBrideInviteCode() -> String {
        let chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return "BB" + String((0..<4).map { _ in chars.randomElement()! })
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
