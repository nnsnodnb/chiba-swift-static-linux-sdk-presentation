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
  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(
          japanese: "動的リンク・静的リンク",
          english: "Dynamic Linking / Static Linking"
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
    LinkingSlide()
  }
  .previewColor(foreground: .white, background: .black)
}
