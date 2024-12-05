//
//  AcknowledgementSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/04.
//

import SlideKit
import SwiftUI

@Slide
struct AcknowledgementSlide: View {
  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(japanese: "謝辞", english: "Acknowledgements")
      },
      content: {
        VStack(alignment: .leading, spacing: 20) {
          Item("Fuller. Inc.") {
            Item("https://www.fuller-inc.com", accessory: nil)
              .offset(y: -20)
          }
          Item("@arasan01_me") {
            Item("https://x.com/arasan01_me", accessory: nil)
              .offset(y: -20)
          }
          Item("mtj0928/SlideGen") {
            Item("https://github.com/mtj0928/SlideGen", accessory: nil)
              .offset(y: -20)
          }
          Item("mtj0928/SlideKit") {
            Item("https://github.com/mtj0928/SlideKit", accessory: nil)
              .offset(y: -20)
          }
          Item("arasan01/swift-linux-sdk-cutomallocator") {
            Item(
              "https://github.com/arasan01/swift-linux-sdk-cutomallocator",
              accessory: nil
            )
            .offset(y: -20)
          }
        }
      }
    )
  }
}

#Preview {
  SlidePreview {
    AcknowledgementSlide()
  }
  .previewColor(foreground: .white, background: .black)
}
