//
//  InfoStep2View.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct InfoStep2View: View {
  
  @State private var shouldNavigate: Bool = false
  // MARK: - 뒤로가기 기능 호출 (기본 애니메이션 유지)
  @Environment(\.dismiss)
  private var dismiss: DismissAction
  
  // MARK: - ViewModel
  @StateObject private var viewModel: CreateGroupViewModel
  
  // MARK: - Input States
  @State private var accountName: String = ""
  @State private var accountNumber: String = ""
  
  // MARK: - Validation States
  @State private var isAccountNameValid: Bool = true
  @State private var isAccountNumberValid: Bool = true
  
  // MARK: - Initializer
  init(viewModel: CreateGroupViewModel) {
    _viewModel = StateObject(wrappedValue: viewModel)
  }
  
  // MARK: - Format Utilities
  
  // 한글만 허용 + 길이 제한 (2~5자)
  func isValidAccountHolderName(_ input: String) -> Bool {
    let regex: String = "^[가-힣]{2,5}$"
    return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: input)
  }
  
  // MARK: - View Body
  var body: some View {
    VStack(spacing: 0) {
      CustomProgressView(progress: 0.5)
      
      ScrollView {
        VStack(alignment: .leading) {
          // 설명 텍스트
          (
            Text("화환을 ") +
            Text("받는 분")
              .foregroundColor(GSColor.primary) +
            Text("의 \n정보를 수집할게요")
          )
          .font(GSFont.title2)
          .foregroundColor(GSColor.black)
          .padding(.bottom, 32)
          .padding(.top, 57)
          
          // 받을 분 입력
          CustomTextField(
            title: "받을 분",
            infoText: " (신랑 혹은 신부)",
            placeholder: "화환을 받는 분의 이름을 입력해주세요",
            text: $accountName,
            isValid: $isAccountNameValid
          )
          .onChange(of: accountName) {
            isAccountNameValid = isValidAccountHolderName(accountName)
          }
          .padding(.bottom, 32)
          
          // 계좌번호 입력
          CustomTextField(
            title: "계좌번호",
            infoText: " (신랑 혹은 신부)",
            placeholder: "모바일 청첩장에 있는 계좌번호를 입력해주세요",
            text: $accountNumber,
            isValid: $isAccountNumberValid
          )
          .onChange(of: accountNumber) {
            isAccountNumberValid = !accountNumber.isEmpty
          }
          .padding(.bottom, 32)
          
          Spacer(minLength: 0)
        }
        
        // 다음 버튼
        PrimaryButton(
          title: "다음",
          style: .custom(textColor: GSColor.white, backgroundColor: GSColor.primary, isEnable: true),
          action: {
            // 다음 클릭 시 네비게이션 활성화
            shouldNavigate = true
          }
        )
        .padding(.bottom, 30)
      }
      .padding(.horizontal, 16)
      .navigationTitle("") // 타이틀 비우기
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden(true)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: {
            dismiss()
          }, label: {
            HStack(spacing: 4) {
              Image(systemName: "chevron.left")
                .foregroundColor(.black)
            }
          })
        }
      }
      .onTapGesture {
        self.endTextEditing()
      }
    }
  }
}
