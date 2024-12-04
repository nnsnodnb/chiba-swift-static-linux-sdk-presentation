//
//  ReferenceSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/04.
//

import SlideKit
import SwiftUI

@Slide
struct ReferenceSlide: View {
  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(japanese: "参考", english: "References")
      },
      content: {
        Item("Swiftの新機能", accessory: 1) {
          Item(
            "https://developer.apple.com/jp/videos/play/wwdc2024/10136/",
            accessory: nil
          )
        }
        Item("Getting Started with the Static Linux SDK", accessory: 2) {
          Item(
            "https://www.swift.org/documentation/articles/static-linux-getting-started.html",
            accessory: nil
          )
        }
      }
    )
  }
}

#Preview {
  SlidePreview {
    ReferenceSlide()
  }
  .previewColor(foreground: .white, background: .black)
}
