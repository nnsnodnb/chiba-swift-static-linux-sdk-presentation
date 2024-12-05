//
//  ExtraSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/06.
//

import SlideKit
import SwiftUI

@Slide
struct ExtraSlide: View {
  enum SlidePhasedState: Int, PhasedState {
    case initial, web, regret
  }

  @Phase var phase: SlidePhasedState

  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(japanese: "おまけ", english: "Extra")
      },
      content: {
        item(
          japanese: "Golangでの場合（静的リンク）",
          english: "In the case of Golang (Static Link)"
        )
        if phase == .initial {
          Code("""
$ cat main.go
package main

import "fmt"

func main() {
  fmt.Println("Hello, world!")
}

$ CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build
$ ls -sh hello
2.1M hello
""",
               colorTheme: .defaultDark,
               fontSize: 34
          )
        }
        if phase.isAfter(.web) {
          Code("""
Running 10s test @ http://127.0.0.1:8080
  4 threads and 128 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     6.51ms   34.05ms 573.51ms   98.67%
    Req/Sec    10.50k     1.17k   11.86k    96.74%
  385676 requests in 10.07s, 46.71MB read
Requests/sec:  38300.46
Transfer/sec:      4.64MB
""",
               colorTheme: .defaultDark,
               fontSize: 34)
          if phase.isAfter(.regret) {
            item(
              japanese: "速すぎた。比較したのを後悔した。",
              english: "Too fast. I regret comparing them."
            )
          }
        }
      }
    )
  }

  func item(
    japanese: LocalizedStringKey,
    english: LocalizedStringKey?
  ) -> some View {
    Item(japanese) {
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

struct ExtraSlide_Previews: PreviewProvider {
  static var previews: some View {
    SlidePreview {
      ExtraSlide()
        .phase(.initial)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("ExtraSlide - Initial")
    SlidePreview {
      ExtraSlide()
        .phase(.regret)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("ExtraSlide - Regret")
  }
}
