//
//  UIStyle+Labels.swift
//  JiraTimeTrackerDebug
//

import Foundation
import SurfUtils

extension UIStyle where Control == UILabel {

    static var title: UIStyle<UILabel> {
        CommonLabelStyle(textColor: Styles.Colors.Main.white.color,
                         font: UIFont.systemFont(ofSize: 20, weight: .bold),
                         kern: nil,
                         lineHeight: nil,
                         alignment: .left,
                         linesCount: 0)
    }

    static var subtitle: UIStyle<UILabel> {
        CommonLabelStyle(textColor: Styles.Colors.Main.white.color,
                         font: UIFont.systemFont(ofSize: 16, weight: .regular),
                         kern: nil,
                         lineHeight: nil,
                         alignment: .left,
                         linesCount: 0)
    }
}
