//
//  HelloFuller.swift
//  ChibaSwiftSwiftLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/04.
//

import SlideKit
import SwiftUI

@Slide
struct HelloFuller: View {
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Text("フラーの皆さんお久しぶりです👋")
        .font(.system(size: 120, weight: .bold))
      Text("Long time no see, everyone at Fuller.")
        .font(.system(size: 60))
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color(.fuller))
  }
}

#Preview {
  SlidePreview {
    HelloFuller()
  }
}
