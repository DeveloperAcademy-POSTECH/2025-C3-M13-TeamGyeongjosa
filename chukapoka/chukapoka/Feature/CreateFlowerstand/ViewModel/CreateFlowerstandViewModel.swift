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
    
    @Published var moneyinputVM = FlowerstandAmountViewModel()
    
    func goNext() {
        if let next = Step(rawValue: step.rawValue + 1) {
            step = next
        }
    }
    
    var isNextEnabled: Bool {
        switch step {
        case .amount:
            return moneyinputVM.isVaild
        default:
            return true
        }
    }
}
//    struct State {
//        var step: Step = .amount
//        
//        var amount: Int? = nil
//        
//        // 꽃 기본 색상 꽃 선택시
//        var selectedColor: Color = GSColor.yellow
//        var selectedFlower: String = "YellowFlower"
//        
//        var message: String = ""
//        
//        var recipientName: String = "강지수"
//        
//        var isLoading: Bool = false
//    }
//    
//    enum Action {
//        case inputAmount(String)
//        case selectFlower(String)
//        case selectColor(Color)
//        case inputMessage(String)
//        case tapNext
//        case tapBack
//        case complete
//    }
//    
//    @Published var state: State = State()
//    
//    func action(_ action: Action) {
//        switch action {
//        case let .inputAmount(text):
//            let filtered: String = String(text.filter { $0.isNumber }.prefix(3))
//            state.amount = Int(filtered)
//            
//        case let .selectFlower(flowerName):
//            state.selectedFlower = flowerName
//            
//        case let .selectColor(color):
//            state.selectedColor = color
//            
//        case let .inputMessage(message):
//            state.message = message
//            
//        case .tapNext:
//            if let next = Step(rawValue: state.step.rawValue + 1) {
//                state.step = next
//            }
//            
//        case .tapBack:
//            if let prev = Step(rawValue: state.step.rawValue - 1) {
//                state.step = prev
//            }
//            
//        case .complete:
//            state.isLoading = true
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                self.state.isLoading = false
//                if let next = Step(rawValue: self.state.step.rawValue + 1) {
//                    self.state.step = next
//                }
//            }
//        }
//    }
//    
//    var bindingAmountText: Binding<String> {
//        Binding(
//            get: { self.state.amount.map { "\($0)" } ?? "" },
//            set: { self.action(.inputAmount($0)) }
//        )
//    }
//    
//    var isValidAmount: Bool {
//        if let amount = state.amount, amount > 0 {
//            return true
//        }
//        return false
//    }
//    
//    var isValidMessage: Bool {
//        !state.message.isEmpty && state.message.count <= 10
//    }
//    
//    var nextButtonEnabled: Bool {
//        switch state.step {
//        case .amount:
//            return isValidAmount
//        case .message:
//            return isValidMessage
//        default:
//            return true
//        }
//    }
//}
