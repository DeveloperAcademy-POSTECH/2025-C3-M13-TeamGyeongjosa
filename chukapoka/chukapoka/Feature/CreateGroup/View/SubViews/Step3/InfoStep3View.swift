//
//  InfoStep1View.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct InfoStep3View: View {
  
  @State private var shouldNavigate: Bool = false
  // MARK: - 뒤로가기 기능 호출 (기본 애니메이션 유지)
  @Environment(\.dismiss)
  private var dismiss: DismissAction
  
  // MARK: - ViewModel
  @StateObject private var viewModel: CreateGroupViewModel
  
  // MARK: - Input States
  @State private var Name: String = ""
  @State private var accountNumber: String = ""
  @State private var phoneNumber: String = ""
  
  // MARK: - Validation States
  @State private var isGroupNameValid: Bool = true
  @State private var isLocationValid: Bool = true
  @State private var isDateValid: Bool = true
  @State private var isTimeValid: Bool = true
  
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
    CustomProgressView(progress: 0.75)
    
    ScrollView {
      VStack(alignment: .leading) {
        // 설명 텍스트
        (
          Text("화환을 ") +
          Text("보내는 분")
            .foregroundColor(GSColor.primary) +
          Text("의 \n정보를 수집할게요")
        )
        .font(GSFont.title2)
        .foregroundColor(GSColor.black)
        .padding(.bottom, 8)
        .padding(.top, 57)
        Text("결혼식 전날까지 돈을 안전하게 보관하기 위함이에요")
          .font(GSFont.caption2)
          .foregroundColor(GSColor.black)
          .padding(.bottom, 32)
        
        // 보내는 분 입력
        CustomTextField(
          title: "보내는 분",
          placeholder: "화환을 보내는 분의 이름을 입력해주세요",
          text: $Name,
          isValid: $isGroupNameValid
        )
        .padding(.bottom, 32)
        
        // 계좌번호 입력
        CustomTextField(
          title: "계좌번호",
          placeholder: "화환을 보내는 분의 계좌번호를 입력해주세요",
          text: $accountNumber,
          isValid: $isLocationValid
        )
        .padding(.bottom, 32)
        
        // 연락처 입력
        CustomTextField(
          title: "연락처",
          placeholder: "010-1234-5678",
          text: $phoneNumber,
          isValid: $isLocationValid
        )
        .padding(.bottom, 32)
        
        Spacer()
        
        Text("파티가 해산되면 입력하신 정보로 돌려드려요")
          .font(GSFont.caption2)
          .foregroundColor(GSColor.black)
          .frame(maxWidth: .infinity)
          .multilineTextAlignment(.center)
        
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
    }
    .onTapGesture {
      self.endTextEditing()
    }
  }
}
