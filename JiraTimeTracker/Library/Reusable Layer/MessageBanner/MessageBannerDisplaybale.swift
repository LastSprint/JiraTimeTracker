//
//  MessageBannerDisplaybale.swift
//  Jtrack
//

import UIKit
import SwiftMessages

/// Provides interface and default implementation for showing banners on the top of the window
///
/// For using default implamantation you just need to extend your `ViewInput` or any other thing with protocol.
protocol MessageBannerDisplaybale {
    /// Use this for showing any neutral information
    func show(info: String)

    /// Use this fro showing any kind of error
    func show(error: Error)
    func show(error: String)

    /// Use this for showing information about success
    func show(success: String)
    func show(warning: String)
}

// MARK: - Default Impl

extension MessageBannerDisplaybale {
    func show(info: String) {
        self.show(banner: .init(state: .info, text: info))
    }

    func show(error: Error) {
        self.show(error: error.localizedDescription)
    }

    func show(error: String) {
        self.show(banner: .init(state: .error, text: error))
    }

    func show(success: String) {
        self.show(banner: .init(state: .success, text: success))
    }

    func show(warning: String) {
        self.show(banner: .init(state: .warning, text: warning))
    }

    private func show(banner: MessageBannerView) {
        var config = SwiftMessages.Config()
        config.presentationContext = .window(windowLevel: .statusBar)
        config.presentationStyle = .top
        SwiftMessages.sharedInstance.show(config: config, view: banner)
    }
}
