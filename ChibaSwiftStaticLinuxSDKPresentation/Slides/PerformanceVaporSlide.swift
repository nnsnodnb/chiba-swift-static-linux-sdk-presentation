//
//  PerformanceVaporSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/06.
//

import SlideKit
import SwiftUI

@Slide
struct PerformanceVaporSlide: View {
  enum SlidePhasedState: Int, PhasedState {
    case initial, useVapor, testing, win, result
  }

  @Phase var phase: SlidePhasedState

  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(
          japanese: "パフォーマンス検証 ver.2",
          english: "Performance testing ver.2"
        )
      },
      content: {
        if phase == .initial {
          VStack(alignment: .center, spacing: 20) {
            Text("そんなんじゃ検証したことにならないでしょ？")
              .font(.system(size: 80))
            Text("Not enough?")
              .font(.system(size: 60))
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .padding(.bottom, 80)
        }
        if phase == .useVapor {
          VStack(alignment: .center, spacing: 60) {
            VStack(alignment: .center, spacing: 20) {
              Text("Vaporで検証しよう")
                .font(.system(size: 80))
              Text("Let’s test it with Vapor.")
                .font(.system(size: 60))
            }
            Code("""
# Vapor create
$ vapor new hello -n

# Build
$ swift build -c release [--swift-sdk aarch64-swift-linux-musl]

# Benchmark (4 threads 128 connections 5 secs)
$ wrk -t 4 -c 128 -d 5 http://127.0.0.1:8080
""",
                 colorTheme: .defaultDark,
                 fontSize: 44
            )
          }

          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .padding(.bottom, 80)
        }
        if phase.isAfter(.testing) && phase != .result {
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
              .border(phase.isAfter(.win) ? Color.red : Color.clear, width: 5)
            }
            .frame(maxWidth: .infinity, alignment: .top)
            VStack(alignment: .leading, spacing: 60) {
              item(
                japanese: "静的リンク",
                english: "Static Linking",
                accessory: 2
              )
              Code("""
Running 10s test @ http://127.0.0.1:8080
  4 threads and 128 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    18.51ms   36.18ms 582.17ms   98.25%
    Req/Sec     2.19k   272.25     3.35k    96.20%
  80459 requests in 10.08s, 11.43MB read
Requests/sec:   7980.65
Transfer/sec:      1.13MB
""",
                   colorTheme: .defaultDark,
                   fontSize: 28
              )
            }
            .frame(maxWidth: .infinity, alignment: .top)
          }
        }
        if phase.isAfter(.result) {
          item(
            japanese: "なんか欲しい結果は得られませんでしたね🤔",
            english: "I didn’t get the desired result.",
            accessory: .bullet
          )
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

struct PerformanceVaporSlide_Previews: PreviewProvider {
  static var previews: some View {
    SlidePreview {
      PerformanceVaporSlide()
        .phase(.initial)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("PerformanceVaporSlide - Initial")
    SlidePreview {
      PerformanceVaporSlide()
        .phase(.useVapor)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("PerformanceVaporSlide - UseVapor")
    SlidePreview {
      PerformanceVaporSlide()
        .phase(.testing)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("PerformanceVaporSlide - Testing")
    SlidePreview {
      PerformanceVaporSlide()
        .phase(.result)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("PerformanceVaporSlide - Result")
  }
}
