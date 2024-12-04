//
//  AgendaSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/04.
//

import SlideKit
import SwiftUI

@Slide
struct AgendaSlide: View {
  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(japanese: "アジェンダ", english: "Agenda")
      },
      content: {
        Item("お前誰よ (自己紹介)")
        Item("動的リンク・静的リンクについて")
        Item("Static Linux SDK について")
        Item("パフォーマンス検証")
        Item("まとめ")
        Item("参考")
        Item("謝辞")
      }
    )
  }
}

#Preview {
  SlidePreview {
    AgendaSlide()
  }
}
