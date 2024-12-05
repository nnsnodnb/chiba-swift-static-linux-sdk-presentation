//
//  PerformanceMimallockSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/06.
//

import SlideKit
import SwiftUI

@Slide
struct PerformanceMimallockSlide: View {
  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(
          japanese: "パフォーマンス検証 ver.2",
          english: "Performance testing ver.2"
        )
      },
      content: {
        item(
          japanese: "mimalloc という Microsoft が開発をしているアロケーターを使用してみた場合",
          english: "When I tried using mimalloc, an allocator developed by Microsoft",
          accessory: .bullet
        )
        HStack(alignment: .top, spacing: 20) {
          VStack(alignment: .leading, spacing: 60) {
            item(
              japanese: "動的リンク",
              english: "Dynamic Linking",
              accessory: 1
            )
            Code("""
    Running 10s test @ http://127.0.0.1:8080
    4 threads and 128 connections
    Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    11.05ms   34.23ms 613.21ms   98.50%
    Req/Sec     4.29k   501.65     5.15k    96.46%
    156876 requests in 10.06s, 22.29MB read
    Requests/sec:  15595.64
    Transfer/sec:      2.22MB
    """,
                 colorTheme: .defaultDark,
                 fontSize: 28
            )
          }
          .frame(maxWidth: .infinity, alignment: .top)
          VStack(alignment: .leading, spacing: 60) {
            item(
              japanese: "静的リンク",
              english: "Static Linking (mimalloc)",
              accessory: 2
            )
            Code("""
    Running 10s test @ http://127.0.0.1:18080
      4 threads and 128 connections
      Thread Stats   Avg      Stdev     Max   +/- Stdev
        Latency    10.83ms   33.36ms 603.73ms   98.78%
        Req/Sec     4.23k   485.55     5.06k    97.28%
      154832 requests in 10.04s, 22.00MB read
    Requests/sec:  15417.36
    Transfer/sec:      2.19MB
    """,
                 colorTheme: .defaultDark,
                 fontSize: 28
            )
          }
          .frame(maxWidth: .infinity, alignment: .top)
        }
      }
    )
  }

  func item(
    japanese: LocalizedStringKey,
    english: LocalizedStringKey?,
    accessory: ItemAccessory
  ) -> some View {
    Item(japanese, accessory: accessory) {
      if let english {
        Item(
          accessory: nil,
          label: {
            Text(english)
              .font(.system(size: 35))
              .offset(y: -20)
          }
        )
      }
    }
  }
}

#Preview {
  SlidePreview {
    PerformanceMimallockSlide()
  }
  .previewColor(foreground: .white, background: .black)
}
