//
//  ConfigurationParameters.swift
//  TextFieldsCatalog
//
//  Created by Александр Чаусов on 28/01/2019.
//  Copyright © 2019 Александр Чаусов. All rights reserved.
//

import UIKit

/// Configuration class with parameters for line in UnderlinedTextField
public final class LineConfiguration {
    /// Insets for line, set it to .zero if you don't want to show it.
    /// Top offset in insets - its offset between bottom of the textField/textView and top of line view
    let insets: UIEdgeInsets
    /// This height will be applied when text field is inactive
    let defaultHeight: CGFloat
    /// This height will be applied when text field is active
    let increasedHeight: CGFloat
    /// Corner radius for line under text field
    let cornerRadius: CGFloat
    /// Superview for line, define as `nil` if you want to place it on default level with other elements
    weak var superview: UIView?
    /// Colors for line under text field
    let colors: ColorConfiguration

    public init(insets: UIEdgeInsets,
                defaultHeight: CGFloat,
                increasedHeight: CGFloat,
                cornerRadius: CGFloat,
                superview: UIView?,
                colors: ColorConfiguration) {
        self.insets = insets
        self.defaultHeight = defaultHeight
        self.increasedHeight = increasedHeight
        self.cornerRadius = cornerRadius
        self.superview = superview
        self.colors = colors
    }
}

/// Configuration class with parameters for floating placeholder
public final class FloatingPlaceholderConfiguration {
    /// This is text font for placeholder
    let font: UIFont
    /// Height of floating placeholder
    let height: CGFloat
    /// This is insets for placeholder in top position. Bottom value is ignored, position is relative to the top.
    let topInsets: UIEdgeInsets
    /// This is insets for placeholder in bottom position. Bottom value is ignored, position is relative to the top.
    let bottomInsets: UIEdgeInsets
    /// This padding for text in placeholder layer will be applied when action button will be shown.
    /// Right inset from topInsets/bottomInsets will be ignored when action button will be shown.
    /// This increased padding ignored for textView.
    let increasedRightPadding: CGFloat
    /// Font size for placeholder in top position
    let smallFontSize: CGFloat
    /// Font size for placeholder in bottom position
    let bigFontSize: CGFloat
    /// Colors for text in top position
    let topColors: ColorConfiguration
    /// Colors for text in bottom position
    let bottomColors: ColorConfiguration

    public init(font: UIFont,
                height: CGFloat,
                topInsets: UIEdgeInsets,
                bottomInsets: UIEdgeInsets,
                increasedRightPadding: CGFloat,
                smallFontSize: CGFloat,
                bigFontSize: CGFloat,
                topColors: ColorConfiguration,
                bottomColors: ColorConfiguration) {
        self.font = font
        self.height = height
        self.topInsets = topInsets
        self.bottomInsets = bottomInsets
        self.increasedRightPadding = increasedRightPadding
        self.smallFontSize = smallFontSize
        self.bigFontSize = bigFontSize
        self.topColors = topColors
        self.bottomColors = bottomColors
    }
}

/// Configuration class with parameters for static placeholder
public final class PlaceholderConfiguration {
    /// Font of placeholder
    let font: UIFont
    /// Colors for placeholder in various states
    let colors: ColorConfiguration

    public init(font: UIFont,
                colors: ColorConfiguration) {
        self.font = font
        self.colors = colors
    }
}

/// Configuration class with parameters for inner text field inside custom text fields
public final class TextFieldConfiguration {
    /// Text font in text field
    let font: UIFont
    /// Default text padding for text in text field
    let defaultPadding: UIEdgeInsets
    /// This padding for text in text field will be applied when action button will be shown
    let increasedPadding: UIEdgeInsets
    /// Text field tint color
    let tintColor: UIColor
    /// Text colors for text in text field
    let colors: ColorConfiguration

    public init(font: UIFont,
                defaultPadding: UIEdgeInsets,
                increasedPadding: UIEdgeInsets,
                tintColor: UIColor,
                colors: ColorConfiguration) {
        self.font = font
        self.defaultPadding = defaultPadding
        self.increasedPadding = increasedPadding
        self.tintColor = tintColor
        self.colors = colors
    }
}

/// Configuration class with parameters for hint label
public final class HintConfiguration {
    /// Text font for hint label
    let font: UIFont
    /// Line height for hint
    let lineHeight: CGFloat
    /// Text colors for hint label
    let colors: ColorConfiguration

    public init(font: UIFont, lineHeight: CGFloat, colors: ColorConfiguration) {
        self.font = font
        self.lineHeight = lineHeight
        self.colors = colors
    }
}

/// Configuration class with parameters for tuning action button inside custom text fields
public final class PasswordModeConfiguration {
    /// The image that will be shown in secure mode state
    let secureModeOnImage: UIImage
    /// The image that will be shown in not secure mode state
    let secureModeOffImage: UIImage
    /// Color of button image in normal state
    let normalColor: UIColor
    /// Color of button image in highlighted and selected state
    let pressedColor: UIColor

    public init(secureModeOnImage: UIImage,
                secureModeOffImage: UIImage,
                normalColor: UIColor,
                pressedColor: UIColor) {
        self.secureModeOnImage = secureModeOnImage
        self.secureModeOffImage = secureModeOffImage
        self.normalColor = normalColor
        self.pressedColor = pressedColor
    }
}

public final class ActionButtonConfiguration {
    /// Button image for action button on text field
    let image: UIImage
    /// Color of button image in normal state
    let normalColor: UIColor
    /// Color of button image in highlighted and selected state
    let pressedColor: UIColor

    public init(image: UIImage,
                normalColor: UIColor,
                pressedColor: UIColor) {
        self.image = image
        self.normalColor = normalColor
        self.pressedColor = pressedColor
    }
}

/// Configuration class with parameters for tuning background color
public final class BackgroundConfiguration {
    /// Text field background color
    let color: UIColor

    public init(color: UIColor) {
        self.color = color
    }
}

/// Configuration class with parameters for tuning color in various text feild states
public final class ColorConfiguration {
    /// Item color in error state. Error has top priority over other states
    let error: UIColor
    /// Item color in inactive state
    let normal: UIColor
    /// Item color in active state
    let active: UIColor
    /// Item color in disabled state
    let disabled: UIColor

    // MARK: - Initialization

    public init(error: UIColor, normal: UIColor, active: UIColor, disabled: UIColor) {
        self.error = error
        self.normal = normal
        self.active = active
        self.disabled = disabled
    }

    public init(color: UIColor) {
        self.error = color
        self.normal = color
        self.active = color
        self.disabled = color
    }

    // MARK: - Internal Methods

    func suitableColor(fieldState: FieldState, isActiveError: Bool) -> UIColor {
        guard !isActiveError else {
            return error
        }
        switch fieldState {
        case .active:
            return active
        case .normal:
            return normal
        case .disabled:
            return disabled
        }
    }

    func suitableColor(state: FieldContainerState) -> UIColor {
        switch state {
        case .error:
            return error
        case .active:
            return active
        case .normal:
            return normal
        case .disabled:
            return disabled
        }
    }

}
