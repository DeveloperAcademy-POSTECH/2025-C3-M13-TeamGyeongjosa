//
//  InfoStep1View.swift
//  chukapoka
//
//  Created by Demian Yoo on 5/31/25.
//

import SwiftUI

struct InfoStep1View: View {
  
  @State private var shouldNavigate: Bool = false
  // MARK: - 뒤로가기 기능 호출 (기본 애니메이션 유지)
  @Environment(\.dismiss)
  private var dismiss: DismissAction
  
  // MARK: - ViewModel
  @StateObject private var viewModel: CreateGroupViewModel
  
  // MARK: - Input States
  @State private var partyName: String = ""
  @State private var weddingPlace: String = ""
  @State private var weddingDate: String = ""
  @State private var weddingTime: String = ""
  
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

  /// 숫자만 허용
  func allowOnlyDigits(_ input: String) -> String {
      input.filter { $0.isNumber }
  }
  
  /// YYYY.MM.DD 형식으로 날짜 자동 포맷팅
  func formatDateInput(_ input: String) -> String {
      let digits: String = input.filter { $0.isNumber }
      let limited: String = String(digits.prefix(8)) // 최대 8자리까지 (YYYYMMDD)

      var result: String = ""
      for (index, char) in limited.enumerated() {
          if index == 4 || index == 6 {
              result.append(".")
          }
          result.append(char)
      }
      return result
  }
  
  /// HH:MM 형식으로 시간 자동 포맷팅
  func formatTimeInput(_ input: String) -> String {
      let digits: String = input.filter { $0.isNumber }
      let limited: String = String(digits.prefix(4)) // 최대 4자리 (HHMM)

      var result: String = ""
      for (index, char) in limited.enumerated() {
          if index == 2 {
              result.append(":")
          }
          result.append(char)
      }
      return result
  }
  
  // MARK: - View Body
  var body: some View {
    ProgressView(value: 0.25)
      .tint(GSColor.primary)
      .background(Color(.white))
      .frame(height: 1)
      .padding(.bottom, 57)
    
    VStack(alignment: .leading) {
      
      // 설명 텍스트
      Text("화환을 함께 전달하기 위해 \n몇 가지 정보를 수집할게요")
        .font(GSFont.title2)
        .foregroundColor(GSColor.black)
        .padding(.bottom, 32)
      
      // 모임명 입력
      CustomTextField(
        title: "모임명",
        placeholder: "어떤 파티에서 화환을 전달하나요?",
        text: $partyName,
        isValid: $isGroupNameValid
      )
      .padding(.bottom, 32)
      
      // 장소 입력
      CustomTextField(
        title: "결혼식 장소",
        placeholder: "결혼식 장소를 입력해주세요",
        text: $weddingPlace,
        isValid: $isLocationValid
      )
      .padding(.bottom, 32)
      
      // 날짜 입력
      CustomTextField(
        title: "결혼식 날짜",
        placeholder: "YYYY. MM. DD",
        text: $weddingDate,
        isValid: $isDateValid
      )
      .keyboardType(.numberPad)
      .onChange(of: weddingDate) {
        weddingDate = formatDateInput(weddingDate)
      }
      .padding(.bottom, 32)
      
      // 시간 입력
      CustomTextField(
        title: "결혼식 시간",
        placeholder: "HH:MM",
        text: $weddingTime,
        isValid: $isTimeValid
      )
      .keyboardType(.numberPad)
      .onChange(of: weddingTime) {
        weddingTime = formatTimeInput(weddingTime)
      }
      .padding(.bottom, 32)
      
      Spacer()
      
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
    // iOS 16 이상 권장 네비게이션 처리
//    .navigationDestination(isPresented: $shouldNavigate) {
//      InfoStep2View(viewModel: viewModel)
//    }
  }
}
