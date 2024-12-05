//
//  WrapUpSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/06.
//

import SlideKit
import SwiftUI

@Slide
struct WrapUpSlide: View {
  enum SlidePhasedState: Int, PhasedState {
    case initial, first, second, third, fourth
  }

  @Phase var phase: SlidePhasedState

  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(japanese: "まとめ", english: "Wrap up")
      },
      content: {
        if phase.isAfter(.first) {
          item(
            japanese: "Static Linux SDKの導入は簡単",
            english: "Introducing the Static Linux SDK is easy."
          )
        }
        if phase.isAfter(.second) {
          item(
            japanese: "Alpine Linuxのような軽量な環境でも実行できる",
            english: "It can run even in lightweight environments like Alpine Linux."
          )
        }
        if phase.isAfter(.third) {
          item(
            japanese: "必ずしも動的リンクよりパフォーマンスが良いわけではない",
            english: "It doesn’t necessarily offer better performance than dynamic linking."
          )
        }
        if phase.isAfter(.fourth) {
          item(
            japanese: "Swift ランタイムなしで実行バイナリを配布できるようになる",
            english: "We can distribute the executable binary without Swift runtime."
          )
        }
      }
    )
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

struct WrapUpSlide_Previews: PreviewProvider {
  static var previews: some View {
    SlidePreview {
      WrapUpSlide()
        .phase(.fourth)
    }
    .previewColor(foreground: .white, background: .black)
  }
}
