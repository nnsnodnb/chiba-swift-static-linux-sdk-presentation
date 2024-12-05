//
//  IncludingStaticSDKDockerImageSlide.swift
//  ChibaSwiftStaticLinuxSDKPresentation
//
//  Created by Yuya Oka on 2024/12/05.
//

import SlideKit
import SwiftUI

@Slide
struct IncludingStaticSDKDockerImageSlide: View {
  enum SlidePhasedState: Int, PhasedState {
    case initial
    case next
    case nnsnodnbFirst
    case arasanFirst
    case nnsnodnbSecond
    case arasanSecond
    case githubContainerRegistry
  }

  @Phase var phase: SlidePhasedState
  var body: some View {
    if phase == .initial {
      VStack(alignment: .leading, spacing: 20) {
        Text("パフォーマンス検証の前に...")
          .font(.system(size: 90))
        Text("Before performance testing.")
          .font(.system(size: 60))
      }
    }
    if phase.isAfter(.next) && phase != .githubContainerRegistry {
      HeaderSlide(
        header: {
          SlideTitle(
            japanese: "Static Linux SDKが入ったDockerイメージほしいなー 😩",
            english: "I want Docker images with a \"Static Linux SDK\" included."
          )
        },
        content: {
          VStack(alignment: .center, spacing: 30) {
            if phase.isAfter(.nnsnodnbFirst) {
              nnsnodnbPost(
                japanese: "Static Linux SDK が含まれた Docker イメージがほしい",
                english: "I want Docker image that includes the Static Linux SDK."
              )
            }
            if phase.isAfter(.arasanFirst) {
              arasanPost(
                japanese: "わかる、自作した",
                english: "I know. I made one myself."
              )
            }
            if phase.isAfter(.nnsnodnbSecond) {
              nnsnodnbPost(
                japanese: "天才",
                english: "Genius."
              )
            }
            if phase.isAfter(.arasanSecond) {
              arasanPost(
                japanese: "アロケータをmusl標準からmimallocにしたやつも便利",
                english: "The one that switches the allocator from the musl default to mimalloc is also convenient."
              )
              VStack(alignment: .trailing, spacing: 20) {
                Text("https://x.com/nnsnodnb/status/1843598365839491082")
                Text("本人から使用許諾済み")
              }
              .padding(.top, 20)
              .frame(maxWidth: .infinity, alignment: .trailing)
              .font(.system(size: 30))
            }
          }
          .padding(.horizontal, 60)
        }
      )
    }
    if phase == .githubContainerRegistry {
      VStack(alignment: .center, spacing: 30) {
        Code(
          "$ docker pull ghcr.io/arasan01/swift:6.0.1-noble-musl-basic-linux-sdk",
          colorTheme: .defaultDark,
          fontSize: 40
        )
        Text("https://github.com/arasan01/swift-linux-sdk-cutomallocator/pkgs/container/swift")
          .font(.system(size: 48, weight: .bold))
      }
    }
  }

  func nnsnodnbPost(japanese: String, english: String) -> some View {
    HStack(alignment: .top, spacing: 40) {
      Image(.nnsnodnbIcon)
        .resizable()
        .frame(width: 100, height: 100)
        .clipShape(Circle())
      VStack(alignment: .leading, spacing: 8) {
        Text(japanese)
        Text(english)
          .font(.system(size: 40))
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }

  func arasanPost(japanese: String, english: String) -> some View {
    HStack(alignment: .top, spacing: 40) {
      VStack(alignment: .trailing, spacing: 8) {
        Text(japanese)
        Text(english)
          .font(.system(size: 40))
      }
      Image(.arasan01MeIcon)
        .resizable()
        .frame(width: 100, height: 100)
        .clipShape(Circle())
    }
    .frame(maxWidth: .infinity, alignment: .trailing)
  }
}

struct IncludingStaticSDKDockerImageSlide_Previews: PreviewProvider {
  static var previews: some View {
    SlidePreview {
      IncludingStaticSDKDockerImageSlide()
        .phase(.arasanSecond)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("IncludingStaticSDKDockerImageSlide - arasanSecond")
    SlidePreview {
      IncludingStaticSDKDockerImageSlide()
        .phase(.githubContainerRegistry)
    }
    .previewColor(foreground: .white, background: .black)
    .previewDisplayName("IncludingStaticSDKDockerImageSlide - githubContainerRegistry")
  }
}
