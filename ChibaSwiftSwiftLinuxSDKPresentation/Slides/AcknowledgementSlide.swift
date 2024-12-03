//
//  AcknowledgementSlide.swift
//  ChibaSwiftSwiftLinuxSDKPresentation
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
        VStack(alignment: .leading, spacing: 10) {
          Text("謝辞")
            .font(.system(size: 60))
          Text("Acknowledgements")
            .font(.system(size: 40))
        }
      },
      content: {
        Item("mtj0928/SlideGen")
        Item("mtj0928/SlideKit") {
          Item("https://github.com/mtj0928/SlideKit/blob/main/LICENSE", accessory: nil)
        }
        Item("Fuller. Inc.") {
          Item("https://www.fuller-inc.com")
        }
      }
    )
  }
}

#Preview {
  SlidePreview {
    AcknowledgementSlide()
  }
}
