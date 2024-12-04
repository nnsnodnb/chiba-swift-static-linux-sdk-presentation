//
//  IncludingStaticSDKDockerImageSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/05.
//

import SlideKit
import SwiftUI

@Slide
struct IncludingStaticSDKDockerImageSlide: View {
  enum SlidePhasedState: Int, PhasedState {
    case initial, next
  }

  @Phase var phase: SlidePhasedState
  var body: some View {
    if phase == .initial {
      VStack(alignment: .leading, spacing: 20) {
        Text("パフォーマンス検証の前に...")
          .font(.system(size: 90))
        Text("Before performance testing.")
          .font(.system(size: 60))
      }
    }
    if phase == .next {
      HeaderSlide(
        header: {
          SlideTitle(
            japanese: "Static Linux SDKが入ったDockerイメージほしいなー 😩",
            english: "I want Docker images with a \"Static Linux SDK\" included."
          )
        },
        content: {
          Text("hello")
        }
      )
    }
  }
}

struct IncludingStaticSDKDockerImageSlide_Previews: PreviewProvider {
  static var previews: some View {
    SlidePreview {
      IncludingStaticSDKDockerImageSlide()
        .phase(.next)
    }
    .previewColor(foreground: .white, background: .black)
  }
}
