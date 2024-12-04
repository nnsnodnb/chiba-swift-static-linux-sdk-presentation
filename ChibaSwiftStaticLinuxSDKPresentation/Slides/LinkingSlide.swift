//
//  LinkingSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/04.
//

import SlideKit
import SwiftUI

@Slide
struct LinkingSlide: View {
  enum SlidePhasedState: Int, PhasedState {
    case initial, dynamic, `static`, dynamicDemo, staticDemo
  }

  @Phase var phase: SlidePhasedState

  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(
          japanese: "動的リンク・静的リンク",
          english: "Dynamic Linking / Static Linking"
        )
      },
      content: {
        if phase == .initial {
          Text("時間が足りないのでめっちゃ簡単に...")
          Text("I don't have enough time, so I'll make it super simple...")
            .font(.system(size: 35))
        }
        else if phase == .dynamic {
          Text("動的リンク（Dynamic Linking）")
          item(
            japanese: "実行時に必要なライブラリやモジュールをリンクして起動",
            english: "Linking and launching the necessary libraries and modules at runtime."
          )
          item(
            japanese: "CocoaPodsは基本こちらが使用される（use_frameworks!）",
            english: "CocoaPods is generally used here."
          )
          item(japanese: "実行バイナリが小さい", english: "The executable binary is small.")
          item(japanese: "パフォーマンス 🤔", english: "Performance 🤔")
        }
        if phase == .static {
          Text("静的リンク（Static Linking）")
          item(
            japanese: "ビルド時に必要なライブラリやモジュールをリンクして成果物を生成",
            english: "Linking the required libraries and modules during the build process to generate product."
          )
          item(
            japanese: "Swift Package Managerは基本こちらが使用される",
            english: "Swift Package Manager is generally used here."
          )
          item(japanese: "実行バイナリが大きい", english: "The executable binary is large.")
          item(japanese: "パフォーマンス 🤩", english: "Performance 🤩")
        }
//        if phase == .dynamicDemo {
//          item(japanese: "動的リンク", english: "Dynamic Linking")
//          Code(
//            """
//$ ls -sh .build/debug/hello
//76K .build/debug/hello
//
//$ time .build/debug/hello
//Hello, world!
//
//real  0m0.010s
//user  0m0.005s
//sys  0m0.005s
//""",
//            colorTheme: .defaultDark
//          )
//        }
//        if phase == .staticDemo {
//          item(japanese: "静的リンク", english: "Static Linking")
//          Code(
//            """
//$ ls -sh .build/debug/hello
//41M .build/debug/hello
//
//$ time .build/debug/hello
//Hello, world!
//
//real  0m0.002s
//user  0m0.000s
//sys  0m0.002s
//""",
//            colorTheme: .defaultDark
//          )
//        }
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

struct LinkingSlide_Preview: PreviewProvider {
  static var previews: some View {
    SlidePreview {
      LinkingSlide()
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("Linking Slide - Initial")

    SlidePreview {
      LinkingSlide()
        .phase(.dynamic)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("Linking Slide - Dynamic")

    SlidePreview {
      LinkingSlide()
        .phase(.static)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("Linking Slide - Static")

    SlidePreview {
      LinkingSlide()
        .phase(.dynamicDemo)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("Linking Slide - Dynamic Demo")

    SlidePreview {
      LinkingSlide()
        .phase(.staticDemo)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("Linking Slide - Static Demo")
  }
}
