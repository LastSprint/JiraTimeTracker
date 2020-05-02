//
//  CommonLabel.swift
//  JiraTimeTrackerDebug
//

import Foundation
import SurfUtils

final class CommonLabelStyle: UIStyle<UILabel> {

    private let textColor: UIColor
    private let font: UIFont
    private let kern: CGFloat?
    private let lineHeight: CGFloat?
    private let alignment: NSTextAlignment
    private let linesCount: Int

    init(textColor: UIColor, font: UIFont, kern: CGFloat?, lineHeight: CGFloat?, alignment: NSTextAlignment, linesCount: Int) {
        self.textColor = textColor
        self.font = font
        self.kern = kern
        self.lineHeight = lineHeight
        self.alignment = alignment
        self.linesCount = linesCount
    }

    override func apply(for control: UILabel) {

        control.numberOfLines = self.linesCount

        let getFontAttr = { () -> StringAttribute in
            guard let height = self.lineHeight else {
                return .font(self.font)
            }

            return .lineHeight(height, font: self.font)
        }

        var attrs = [getFontAttr()]

        if let kern = self.kern {
            attrs.append(.kern(kern))
        }

        control.attributedText = control.text?.with(attributes: [
            .foregroundColor(self.textColor),
            .aligment(self.alignment)
        ] + attrs)
    }
}
