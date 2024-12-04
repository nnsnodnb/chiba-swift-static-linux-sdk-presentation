//
//  SelfIntroduction.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/03.
//

import SlideKit
import SwiftUI

@Slide
struct SelfIntroduction: View {
  enum SlidePhasedState: Int, PhasedState {
    case initial, name, sns, job, lived, worked
  }

  @Phase var phase: SlidePhasedState

  var body: some View {
    HeaderSlide {
      title
    } content: {
      if phase.isAfter(.name) {
        item(
          japanese: "小泉ひやかし",
          english: "My name is Yuya Oka."
        )
      }
      if phase.isAfter(.sns) {
        item(
          japanese: "Twitter（現 𝕏） GitHub 他：@nnsnodnb ",
          english: nil
        )
      }
      if phase.isAfter(.job) {
        item(
          japanese: "iOSアプリエンジニアを引退したプロダクトエンジニア",
          english: "I'm no longer an iOS apps engineer."
        )
      }
      if phase.isAfter(.lived) {
        item(
          japanese: "千葉県柏市若柴に住んでいました",
          english: "I lived in Wakashiba Kashiwa-city, Chiba."
        )
      }
      if phase.isAfter(.worked) {
        item(
          japanese: "フラー株式会社さんで働いていました",
          english: "I worked at Fuller. Inc."
        )
      }
    }
  }

  var title: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("お前誰よ")
        .font(.system(size: 60))
      Text("Who am I?")
        .font(.system(size: 40))
    }
  }

  func item(
    japanese: LocalizedStringKey,
    english: LocalizedStringKey?
  ) -> some View {
    Item(japanese) {
      if let english {
        Item(
          accessory: nil,
          label: {
            Text(english)
              .font(.system(size: 35))
              .offset(y: -20)
          }
        )
      }
    }
  }
}

#Preview {
  SlidePreview {
    SelfIntroduction()
  }
}
