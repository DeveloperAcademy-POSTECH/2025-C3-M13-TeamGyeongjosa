//
//  CreateFlowerstandViewModel.swift
//  chukapoka
//
//  Created by Demian Yoo on 6/5/25.
//
import SwiftUI

@MainActor
final class CreateFlowerstandViewModel: ObservableObject {
    
    struct State {
        var step: Int = 0

        var amount: Int? = nil
        // 꽃 기본 색상 꽃 선택시
        var selectedColor: Color = GSColor.yellow
        var selectedFlower: String = "YellowFlower"

        var message: String = ""

        var recipientName: String = "강지수"

        var isLoading: Bool = false
    }

    enum Action {
        case inputAmount(String)
        case selectFlower(String)
        case selectColor(Color)
        case inputMessage(String)
        case tapNext
        case tapBack
        case complete
    }

    @Published var state: State = State()

    func action(_ action: Action) {
        switch action {
        case let .inputAmount(text):
            let filtered: String = String(text.filter { $0.isNumber }.prefix(3))
            state.amount = Int(filtered)

        case let .selectFlower(flowerName):
            state.selectedFlower = flowerName

        case let .selectColor(color):
            state.selectedColor = color

        case let .inputMessage(message):
            state.message = message

        case .tapNext:
            if state.step < 4 {
                state.step += 1
            }

        case .tapBack:
            if state.step > 0 {
                state.step -= 1
            }

        case .complete:
            state.isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.state.isLoading = false
                self.state.step += 1
            }
        }
    }

    var bindingAmountText: Binding<String> {
        Binding(
            get: { self.state.amount.map { "\($0)" } ?? "" },
            set: { self.action(.inputAmount($0)) }
        )
    }

    var isValidAmount: Bool {
        if let amount = state.amount, amount > 0 {
            return true
        }
        return false
    }

    var isValidMessage: Bool {
        !state.message.isEmpty && state.message.count <= 10
    }
}
