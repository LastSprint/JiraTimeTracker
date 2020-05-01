//
//  UIStyle+UIButton.swift
//  Jtrack
//

import UIKit
import SurfUtils
import TextFieldsCatalog

// MARK: - UIButton

extension UIButton {
    open func apply(for style: UIStyle<UIButton>) {
        style.apply(for: self)
    }
}

// MARK: - UITextField

extension UITextField {
    open func apply(for style: UIStyle<UITextField>) {
        style.apply(for: self)
    }
}
