//
//  TitleSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/03.
//

import SlideKit
import SwiftUI

@Slide
struct TitleSlide: View {
  var body: some View {
    VStack(alignment: .center, spacing: 60) {
      title
      eventName
    }
  }

  var shouldHideIndex: Bool { true }

  var title: some View {
    VStack(alignment: .center, spacing: 8) {
      Text("入門 Static Linux SDK")
        .font(.system(size: 90, weight: .bold))
      Text("Meet Static Linux SDK")
        .font(.system(size: 55, weight: .bold))
    }
  }

  var eventName: some View {
    Text("Chiba.swift #2")
      .font(.system(size: 40, weight: .bold))
  }
}

#Preview {
  SlidePreview {
    TitleSlide()
  }
  .previewColor(foreground: .white, background: .black)
}
