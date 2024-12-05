//
//  PerformanceHelloSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/05.
//

import SlideKit
import SwiftUI

@Slide
struct PerformanceHelloSlide: View {
  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(
          japanese: "パフォーマンス検証",
          english: "Performance testing"
        )
      },
      content: {
        HStack(alignment: .top, spacing: 60) {
          VStack(alignment: .leading, spacing: 60) {
            item(
              japanese: "動的リンク",
              english: "Dynamic Linking",
              accessory: 1
            )
            Code("""
$ time .build/debug/hello
Hello, world!

real  0m0.005s
user  0m0.002s
sys  0m0.003s
""",
                 colorTheme: .defaultDark
            )
          }
          .frame(maxWidth: .infinity, alignment: .top)
          VStack(alignment: .leading, spacing: 60) {
            item(
              japanese: "静的リンク",
              english: "Static Linking",
              accessory: 2
            )
            Code("""
$ time .build/debug/hello
Hello, world!

real  0m0.002s
user  0m0.000s
sys  0m0.002s
""",
                 colorTheme: .defaultDark
            )
          }
          .frame(maxWidth: .infinity, alignment: .top)
        }
      }
    )
  }

  func item(
    japanese: LocalizedStringKey,
    english: LocalizedStringKey?,
    accessory: ItemAccessory
  ) -> some View {
    Item(japanese, accessory: accessory) {
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
    PerformanceHelloSlide()
  }
  .previewColor(foreground: .white, background: .black)
}
