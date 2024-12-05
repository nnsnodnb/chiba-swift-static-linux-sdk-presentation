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
        Item("Fuller. Inc.") {
          Item("https://www.fuller-inc.com", accessory: nil)
        }
        Item("mtj0928/SlideGen") {
          Item("https://github.com/mtj0928/SlideGen", accessory: nil)
        }
        Item("mtj0928/SlideKit") {
          Item("https://github.com/mtj0928/SlideKit", accessory: nil)
        }
        Item("@arasan01_me") {
          Item("https://x.com/arasan01_me", accessory: nil)
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
