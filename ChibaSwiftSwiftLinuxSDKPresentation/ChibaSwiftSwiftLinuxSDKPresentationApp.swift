//
//  ChibaSwiftSwiftLinuxSDKPresentationApp.swift
//
//  This file is automatically generated by SlideGen
//

import SwiftUI
import SlideKit

@main
struct ChibaSwiftSwiftLinuxSDKPresentationApp: App {

    /// Edit slide configurations in SlideConfiguration.swift
    private static let configuration = SlideConfiguration()

    /// A presentation content view.
    /// Edit the view here if you'd like to set environments, overlay views or background views.
    var presentationContentView: some View {
        SlideRouterView(slideIndexController: Self.configuration.slideIndexController)
            .background(.white)
            .foregroundColor(.black)
    }

    var body: some Scene {
        WindowGroup {
            PresentationView(slideSize: Self.configuration.size) {
                presentationContentView
            }
        }
        .setupAsPresentationWindow(Self.configuration.slideIndexController) {
            NSWorkspace.shared.open(URL(string: "Foo://editor")!)
        }
        .addPDFExportCommands(for: presentationContentView, with: Self.configuration.slideIndexController, size: Self.configuration.size)

        WindowGroup {
            macOSPresenterView(
                slideSize: Self.configuration.size,
                slideIndexController: Self.configuration.slideIndexController
            ) {
                presentationContentView
            }
        }
        .setupAsPresenterWindow()
    }
}
