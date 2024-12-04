//
//  SlideConfiguration.swift
//
//  This file is automatically generated by SlideGen
//

import SwiftUI
import SlideKit

@MainActor
struct SlideConfiguration {

  /// Edit the slide size.
  let size = SlideSize.standard16_9

  ///  Add your slides into the trailing closure.
  let slideIndexController = SlideIndexController {
    TitleSlide()
    AgendaSlide()
    SelfIntroductionSlide()
    HelloFullerSlide()
    AboutStaticLinuxSDKSlide()
    LinkingSlide()
    IncludingStaticSDKDockerImageSlide()
    ReferenceSlide()
    AcknowledgementSlide()
  }
}
