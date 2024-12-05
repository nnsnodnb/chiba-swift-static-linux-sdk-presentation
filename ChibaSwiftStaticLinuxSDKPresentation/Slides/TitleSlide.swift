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
    VStack(alignment: .center, spacing: 12) {
      Text("Static Linux SDK を使った\nLinux アプリ開発を始めよう！")
        .font(.system(size: 90, weight: .bold))
      Text("Let’s start Linux app development using the \"Static Linux SDK\"!")
        .font(.system(size: 55, weight: .bold))
    }
    .multilineTextAlignment(.center)
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
