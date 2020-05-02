//
//  UIImage+Nuke.swift
//  JiraTimeTrackerDebug
//

import Foundation
import Nuke

extension UIImageView {
    func load(url: String) {

        guard let converted = URL(string: url) else {
            return
        }

        var request = URLRequest(url: converted)
        request.httpHeaders["Authorization"] = AppDelegate.authToken ?? ""

        self.contentMode = .scaleAspectFit

        ImageDecoderRegistry.shared.register { (cntx) -> ImageDecoding? in
            guard String(data: cntx.data, encoding: .utf8) != nil else {
                return nil
            }
            return SVGIMageDecoder()
        }

        Nuke.loadImage(with: .init(urlRequest: request), into: self)
    }
}
