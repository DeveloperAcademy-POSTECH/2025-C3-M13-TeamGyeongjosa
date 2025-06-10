//
//  MemberJoinViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/9/25.
//

import SwiftUI
import SwiftData

// MARK: - Enum (단계 정의)
enum MemberJoinStep: Int, CaseIterable, Identifiable {
    case info, money, decorate, message, showResult
    
    var id: Int { rawValue }
}

// MARK: - Action Enum
enum MemberJoinAction {
    case updateName(String)
    case updatePhone(String)
    case updateAccount(String)
    case updateAmount(String)
    case updateColor(Color)
    case updateFlower(String)
    case updateMessage(String)
    case goNext
    case goBack
    case save
}

// MARK: - State Struct
struct MemberJoinState {
    var step: MemberJoinStep = .info
    
    // Step1
    var name: String = ""
    var phoneNumber: String = ""
    var accountNumber: String = ""
    
    // Step2
    var amountText: String = ""
    var amount: Int? {
        Int(amountText.filter(\.isNumber))
    }
    
    // Step3
    var selectedColor: Color = GSColor.yellow
    var selectedFlower: String = "YellowFlower"
    
    // Step4
    var message: String = ""
    
    var isNameValid: Bool = true
    var isPhoneValid: Bool = true
    var isAccountValid: Bool = true
}

// MARK: - ViewModel
@MainActor
final class MemberJoinViewModel: ObservableObject {
    // 주입
    let coordinator: AppCoordinator
    let party: Party
    
    // 상태
    @Published private(set) var state = MemberJoinState()
    
    init(coordinator: AppCoordinator, party: Party) {
        self.coordinator = coordinator
        self.party = party
    }
    
    // 컴퓨티드 프로퍼티
    var isNextEnabled: Bool {
        switch state.step {
        case .info:
            return !state.name.isEmpty || !state.accountNumber.isEmpty || state.phoneNumber.filter(\.isNumber).count == 11
        case .money:
            return state.amount ?? 0 > 0
        case .decorate:
            return !state.selectedFlower.isEmpty
        case .message:
            return !state.message.isEmpty && state.message.count <= 10
        case .showResult:
            return true
        }
    }
    
    var nextButtonTitle: String {
        state.step == .showResult ? "완료" : "다음"
    }
    
    // 액션 디스패쳐
    func send(_ action: MemberJoinAction, modelContext: ModelContext? = nil) {
        switch action {
        case .updateName(let name):
            state.name = name
        case .updatePhone(let phone):
            state.phoneNumber = formatPhoneNumberInput(phone)
        case .updateAccount(let acc):
            state.accountNumber = acc
        case .updateAmount(let text):
            state.amountText = String(text.filter(\.isNumber).prefix(4))
        case .updateColor(let color):
            state.selectedColor = color
        case .updateFlower(let flower):
            state.selectedFlower = flower
        case .updateMessage(let message):
            state.message = message
        case .goNext:
            if state.step == .info {
                validateFields()
                if !state.isNameValid || !state.isPhoneValid || !state.isAccountValid {
                    return // 하나라도 틀리면 넘어가지 않음
                }
            }
            if let next = MemberJoinStep(rawValue: state.step.rawValue + 1) {
                state.step = next
            }
        case .goBack:
            if state.step == .info {
                coordinator.popToRoot()
            } else if let previous = MemberJoinStep(rawValue: state.step.rawValue - 1) {
                state.step = previous
            }
        case .save:
            guard let context = modelContext else { return }
            saveMember(in: context)
        }
    }
    
    // 데이터 세이브 함수
    private func saveMember(in context: ModelContext) {
        let member = PartyMember(
            isLeader: false,
            name: state.name,
            accountNumber: state.accountNumber,
            phoneNumber: state.phoneNumber,
            money: state.amount ?? 0,
            message: state.message,
            flowerstandPath: generateFlowerstandPath(),
            party: party
        )
        context.insert(member)
        do {
            try context.save()
            print("""
                  멤버 저장됨: - 이름: \(member.name)
                  - 소속 파티: \(party.name)
                  - 전달 금액: \(member.money)
                  - 꽃 장식: \(member.flowerstandPath)
                  - 메시지: \(member.message)
            """)
        } catch {
            print("저장 실패: \(error.localizedDescription)")
        }
    }
    
    private func generateFlowerstandPath() -> String {
        switch state.selectedColor {
        case GSColor.yellow: return "\(state.selectedFlower)_Yellow"
        case GSColor.pink: return "\(state.selectedFlower)_Pink"
        case GSColor.purple: return "\(state.selectedFlower)_Purple"
        default: return "\(state.selectedFlower)_Yellow"
        }
    }
    
    // 내부 유효성 로직
    func isValidKoreanName(_ name: String) -> Bool {
        let regex = "^[가-힣]{2,4}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: name)
    }
    
    func isValidPhone(_ phone: String) -> Bool {
        let numericPhone = phone.filter(\.isNumber)
        let regex = "^01[0-9]{8,9}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: numericPhone)
    }
    
    func validateFields() {
        state.isNameValid = isValidKoreanName(state.name)
        state.isPhoneValid = isValidPhone(state.phoneNumber)
        state.isAccountValid = !state.accountNumber.isEmpty
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
}
