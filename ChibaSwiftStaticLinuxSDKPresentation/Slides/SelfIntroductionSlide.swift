//
//  SelfIntroductionSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/03.
//

import SlideKit
import SwiftUI

@Slide
struct SelfIntroductionSlide: View {
  enum SlidePhasedState: Int, PhasedState {
    case initial, name, sns, job, lived, worked
  }

  @Phase var phase: SlidePhasedState

  var body: some View {
    HeaderSlide {
      SlideTitle(japanese: "お前誰よ", english: "Who am I")
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

struct SelfIntroductionSlide_Previews: PreviewProvider {
  static var previews: some View {
    SlidePreview {
      SelfIntroductionSlide()
        .phase(.worked)
    }
    .previewColor(foreground: .white, background: .black)
  }
}
