//
//  UIStyle+Buttons.swift
//  Jtrack
//

import Foundation
import UIKit
import SurfUtils

extension UIStyle where Control == UIButton {

    static var main: UIStyle<UIButton> {
        CommonUIButtonStyle(titleColor: .white,
                            borderColor: Styles.Colors.Main.border.color,
                            cornerRadius: 16,
                            shadowColor: UIColor.white.cgColor,
                            shadowOffset: .zero,
                            shadowRadius: 0,
                            shadowOpacity: 0,
                            backgroundColor: Styles.Colors.Main.control.color)
    }
}
