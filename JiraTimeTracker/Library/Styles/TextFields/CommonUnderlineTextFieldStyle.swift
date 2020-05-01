////
////  CommonUnderlineTextFieldStyle.swift
////  Jtrack
////
//
//import TextFieldsCatalog
//import UIKit
//import SurfUtils
//
//final class CommonUnderlineTextFieldStyle: UIStyle<UnderlinedTextField> {
//
//    override func apply(for control: UnderlinedTextField) {
//        control.configuration = self.createConfiguration()
//        control.configure(autocapitalizationType: .none)
//        control.configure(correction: .no, keyboardType: .default)
//        control.setTextFieldMode(.password(.visibleOnNotEmptyText))
//        control.validator = TextFieldValidator(minLength: 4, maxLength: nil, regex: nil)
//        control.backgroundColor = .white
//        control.tintColor = .black
//        control.layer.cornerRadius = 16
//        control.layer.borderWidth = 0.5
//        control.isNativePlaceholder = true
//        control.layer.shadowOpacity = 0.3
//        control.layer.shadowColor = UIColor.white.cgColor
//        control.layer.shadowOffset = .init(width: 1, height: 1)
//        control.layer.shadowRadius = 8
//    }
//}
//
//extension CommonUnderlineTextFieldStyle {
//    func createConfiguration() -> UnderlinedTextFieldConfiguration {
//
//        let config = UnderlinedTextFieldConfiguration()
//
//        let colorConfig = ColorConfiguration(error: .red,
//                                             normal: .white,
//                                             active: .white,
//                                             disabled: .gray)
//
//        config.line = LineConfiguration(insets: UIEdgeInsets(top: 5, left: 16, bottom: 0, right: 16),
//                                        defaultHeight: 1,
//                                        increasedHeight: 2,
//                                        cornerRadius: 1,
//                                        superview: nil,
//                                        colors: colorConfig)
//
//        config.placeholder = FloatingPlaceholderConfiguration(font: UIFont.systemFont(ofSize: 16, weight: .regular),
//                                                              height: 19,
//                                                              topInsets: UIEdgeInsets(top: 2, left: 16, bottom: 0, right: 50),
//                                                              bottomInsets: UIEdgeInsets(top: 23, left: 15, bottom: 0, right: 16),
//                                                              increasedRightPadding: 0,
//                                                              smallFontSize: 12,
//                                                              bigFontSize: 16,
//                                                              topColors: colorConfig,
//                                                              bottomColors: colorConfig)
//
//        config.textField = TextFieldConfiguration(font: UIFont.systemFont(ofSize: 16, weight: .regular),
//                                                  defaultPadding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
//                                                  increasedPadding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 40),
//                                                  tintColor: .white,
//                                                  colors: colorConfig)
//
//        config.hint = HintConfiguration(font: UIFont.systemFont(ofSize: 12, weight: .regular),
//                                        lineHeight: 16,
//                                        colors: colorConfig)
//
//        config.background = BackgroundConfiguration(color: Styles.Colors.main.color)
//
//        return config
//
//    }
//}
