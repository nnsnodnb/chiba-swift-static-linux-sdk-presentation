//
//  LinuxSupportUntilNowSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/05.
//

import SlideKit
import SwiftUI

@Slide
struct LinuxSupportUntilNowSlide: View {
  enum SlidePhasedState: Int, PhasedState {
    case initial, prepare, prepareBuild, watchFile, runNoRuntimeCopy, runNoRuntimeExecute
  }

  @Phase var phase: SlidePhasedState

  var body: some View {
    HeaderSlide(
      header: {
        SlideTitle(
          japanese: "前回のSwift for Linux！",
          english: "Linux support until now."
        )
      },
      content: {
        switch phase {
        case .initial:
          EmptyView()
        case .prepare,
            .prepareBuild,
            .watchFile:
          if phase.isAfter(.prepare) {
            item(japanese: "Linux向けにビルド", english: "Build for Linux")
              .offset(y: -30)
            Code("""
$ mkdir hello && cd hello
$ swift package init --type executable
Creating executable package: hello
Creating Package.swift
Creating .gitignore
Creating Sources/
Creating Sources/main.swift
""",
                 colorTheme: .defaultDark,
                 fontSize: 35
            )
            .offset(y: -60)
            if phase.isAfter(.prepareBuild) {
              Code("""
$ swift build
Building for debugging...
[8/8] Linking hello
Build complete! (1.18s)
""",
                   colorTheme: .defaultDark,
                   fontSize: 35
              )
              .offset(y: -60)
            }
            if phase.isAfter(.watchFile) {
              Code("""
$ file .build/debug/hello
.build/debug/hello: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, with debug_info, not stripped
""",
                   colorTheme: .defaultDark,
                   fontSize: 35
              )
              .offset(y: -60)
            }
          }
        case .runNoRuntimeCopy, .runNoRuntimeExecute:
          item(japanese: "Swift ランタイムなしのUbuntuで実行", english: "Runs on Ubuntu without Swift runtime.")
          if phase.isAfter(.runNoRuntimeCopy) {
            Code("""
$ docker cp f95bff9ca073:/hello/.build/debug/hello ./hello
Successfully copied 78.8kB to /Users/nnsnodnb/hello
""",
                 colorTheme: .defaultDark,
                 fontSize: 35
            )
          }
          if phase.isAfter(.runNoRuntimeExecute) {
            Code("""
$ docker run --rm -t -v $(pwd)/hello:/hello ubuntu:24.04 /hello
/hello: error while loading shared libraries: libswiftSwiftOnoneSupport.so: cannot open shared object file: No such file or directory
""",
                 colorTheme: .defaultDark,
                 fontSize: 35
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

struct LinuxSupportUntilNowSlide_Previews: PreviewProvider {
  static var previews: some View {
    SlidePreview {
      LinuxSupportUntilNowSlide()
        .phase(.watchFile)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("LinuxSupportUntilNowSlide - WatchFile")
    SlidePreview {
      LinuxSupportUntilNowSlide()
        .phase(.runNoRuntimeExecute)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("LinuxSupportUntilNowSlide - RunNoRuntimeExecute")
  }
}
