//
//  CommonTextFieldStyle.swift
//  Jtrack
//
//  Created by Александр Кравченков on 01.05.2020.
//

import Foundation
import UIKit
import SurfUtils

final class CommonTextFieldStyle: UIStyle<UITextField> {

    private let backgroundColor: UIColor
    private let tintColor: UIColor
    private let borderColor: CGColor
    private let textColor: UIColor

    init(backgroundColor: UIColor, tintColor: UIColor, borderColor: CGColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
        self.borderColor = borderColor
        self.textColor = textColor
    }

    override func apply(for control: UITextField) {
        control.backgroundColor = self.backgroundColor
        control.layer.cornerRadius = 16
        control.layer.borderWidth = 0.5
        control.layer.borderColor = self.borderColor
        control.clipsToBounds = true
        control.tintColor = self.tintColor
        control.textColor = self.textColor
    }
}
