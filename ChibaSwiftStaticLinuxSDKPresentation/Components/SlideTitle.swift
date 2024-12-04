//
//  SlideTitle.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/04.
//

import SwiftUI

struct SlideTitle: View {
  let japanese: String
  let english: String

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(japanese)
        .font(.system(size: 60))
      Text(english)
        .font(.system(size: 40))
    }
  }
}

#Preview {
  SlideTitle(japanese: "テストタイトル", english: "Test title")
}
