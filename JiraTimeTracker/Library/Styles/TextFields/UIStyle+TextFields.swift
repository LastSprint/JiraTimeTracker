//
//  UIStyle+TextFields.swift
//  Jtrack
//

import SurfUtils
import UIKit
import TextFieldsCatalog

// MARK: - UnderlinedTextField

extension UIStyle where Control == UITextField {
    static var main: UIStyle<UITextField> {
        CommonTextFieldStyle(backgroundColor: Styles.Colors.Main.control.color,
                             tintColor: Styles.Colors.Main.white.color,
                             borderColor: Styles.Colors.Main.border.color.cgColor,
                             textColor: Styles.Colors.Main.white.color)
    }

    static var error: UIStyle<UITextField> {
        CommonTextFieldStyle(backgroundColor: Styles.Colors.Main.control.color,
                             tintColor: Styles.Colors.Main.error.color,
                             borderColor: Styles.Colors.Main.error.color.cgColor,
                             textColor: Styles.Colors.Main.error.color)
    }
}
