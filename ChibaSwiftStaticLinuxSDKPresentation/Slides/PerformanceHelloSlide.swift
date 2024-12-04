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
  enum SlidePhasedState: Int, PhasedState {
    case initial, `static`
  }

  @Phase var phase: SlidePhasedState

  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(
          japanese: "パフォーマンス検証",
          english: "Performance testing"
        )
      },
      content: {
        Text("")
      }
    )
  }
}

#Preview {
  SlidePreview {
    PerformanceHelloSlide()
  }
  .previewColor(foreground: .white, background: .black)
}
