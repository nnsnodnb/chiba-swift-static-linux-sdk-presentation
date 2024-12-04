//
//  AboutStaticLinuxSDKSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/04.
//

import SlideKit
import SwiftUI

@Slide
struct AboutStaticLinuxSDKSlide: View {
  enum SlidePhasedState: Int, PhasedState {
    case initial, install, usage, demo
  }

  @Phase var phase: SlidePhasedState

  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(
          japanese: "Static Linux SDKについて",
          english: "About \"Static Linux SDK\""
        )
      },
      content: {
        if !phase.isLast {
          item(
            japanese: "WWDC24にて発表されたLinux向けプログラムの完全静的リンクを可能とする",
            english: "The announcement made at WWDC24 allows for fully statically linked for Linux programs."
          )
          if phase.isAfter(.install) {
            Code(
              "$ swift sdk install <URL> [--checksum <checksum>]",
              colorTheme: .defaultDark
            )
          }
          if phase.isAfter(.usage) {
            Code(
          """
$ swift build --swift-sdk x86_64-swift-linux-musl
$ swift build --swift-sdk aarch64-swift-linux-musl
""",
          colorTheme: .defaultDark
            )
          }
        } else {
          Image(.demoLinuxMusl)
            .resizable()
            .aspectRatio(contentMode: .fit)
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

struct AboutStaticLinuxSDKSlide_Previews: PreviewProvider {
  static var previews: some View {
    SlidePreview {
      AboutStaticLinuxSDKSlide()
        .phase(.usage)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("About Static Linux SDK - Usage")
    SlidePreview {
      AboutStaticLinuxSDKSlide()
        .phase(.demo)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("About Static Linux SDK - Demo")
  }
}
