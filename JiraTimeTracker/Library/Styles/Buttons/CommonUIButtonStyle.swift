//
//  CommonButtonStyle.swift
//  Jtrack
//

import UIKit
import SurfUtils

public final class CommonUIButtonStyle: UIStyle<UIButton> {

    private let titleColor: UIColor
    private let borderColor: UIColor
    private let cornerRadius: CGFloat
    private let shadowColor: CGColor
    private let shadowOffset: CGSize
    private let shadowRadius: CGFloat
    private let shadowOpacity: Float
    private let backgroundColor: UIColor

    public init(titleColor: UIColor,
                borderColor: UIColor,
                cornerRadius: CGFloat,
                shadowColor: CGColor,
                shadowOffset: CGSize,
                shadowRadius: CGFloat,
                shadowOpacity: Float,
                backgroundColor: UIColor) {
        self.titleColor = titleColor
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
        self.backgroundColor = backgroundColor
    }

    override public func apply(for control: UIButton) {
        control.backgroundColor = self.backgroundColor
        control.setTitleColor(self.titleColor, for: .normal)
        control.layer.borderColor = self.borderColor.cgColor
        control.layer.cornerRadius = self.cornerRadius
        control.layer.shadowColor = self.shadowColor
        control.layer.shadowOffset = self.shadowOffset
        control.layer.shadowRadius = self.shadowRadius
        control.layer.shadowOpacity = self.shadowOpacity
        control.layer.borderWidth = AppearenceConstants.Main.borderWidth
    }
}
