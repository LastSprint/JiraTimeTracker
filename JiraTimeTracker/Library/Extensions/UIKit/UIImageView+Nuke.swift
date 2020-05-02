//
//  UIImage+Nuke.swift
//  JiraTimeTrackerDebug
//

import Foundation
import Nuke

extension UIImageView {
    func load(url: String) {

        self.image = Styles.Image.TabBar.projectsItem.image

        guard let converted = URL(string: url) else {
            return
        }

        var request = URLRequest(url: converted)
        request.httpHeaders["Authorization"] = AppDelegate.authToken ?? ""

        Nuke.loadImage(with: .init(urlRequest: request), into: self)
    }
}
