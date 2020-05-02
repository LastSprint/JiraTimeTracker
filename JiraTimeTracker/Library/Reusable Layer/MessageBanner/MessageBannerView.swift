//
//  MessageBannerView.swift
//  Jtrack
//

import UIKit
import SwiftMessages
import SurfUtils

/// Default view for present some information in banner style
final class MessageBannerView: UIView {

    private enum Constant {
        /// Layour contraint constant (equal for top/trailing/leading/bottom)
        static let sideOffset: CGFloat = 16
    }

    enum State {
        case success
        case error
        case info
        case warning
    }

    private let textLabel: UILabel
    private let contentView: UIView

    var state: State {
        didSet {
            self.configure(for: state)
        }
    }

    var text: String {
        didSet {
            self.textLabel.text = self.text
        }
    }

    init(state: State, text: String) {
        self.textLabel = UILabel()
        self.state = state
        self.text = text
        self.contentView = UIView()
        super.init(frame: .zero)
        self.configureAppearence()
    }

    required init?(coder: NSCoder) {
        self.textLabel = UILabel()
        self.state = .info
        self.text = ""
        self.contentView = UIView()
        super.init(coder: coder)
        self.configureAppearence()
    }
}

// MARK: - BackgroundViewable

extension MessageBannerView: BackgroundViewable {
    // swiftlint:disable implicitly_unwrapped_optional
    var backgroundView: UIView! { self.contentView }
    // swiftlint:enable implicitly_unwrapped_optional
}

// MARK: - Identifiable

extension MessageBannerView: Identifiable {
    var id: String { "\(self.state)" }
}

// MARK: - Configuration

private extension MessageBannerView {

    func configureLayout() {
        self.textLabel.textColor = Styles.Colors.Main.white.color
        self.contentView.addSubview(self.textLabel)
        self.textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.textLabel.numberOfLines = 0

        NSLayoutConstraint.activate([
            self.textLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: Constant.sideOffset),
            self.contentView.trailingAnchor.constraint(equalTo: self.textLabel.trailingAnchor, constant: Constant.sideOffset),
            self.textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: Constant.sideOffset),
            self.contentView.bottomAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: Constant.sideOffset)
        ])

        self.addSubview(self.contentView)

        self.contentView.translatesAutoresizingMaskIntoConstraints = false

        #if TARGET_OS_IPHONE
        let topOffset = UIApplication.shared.statusBarFrame.height
        #else
        let topOffset: CGFloat = 46
        #endif

        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: topOffset),
            self.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: Constant.sideOffset),
            self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constant.sideOffset),
            self.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: Constant.sideOffset)
        ])

        self.textLabel.text = self.text
    }

    func configureAppearence() {
        self.configureLayout()
        self.configure(for: self.state)
        self.contentView.layer.borderColor = Styles.Colors.Main.border.color.cgColor
        self.contentView.layer.borderWidth = AppearenceConstants.Main.borderWidth
        self.contentView.layer.cornerRadius = 16
        self.backgroundColor = .clear
    }

    func configure(for state: State) {
        switch state {
        case .error:
            self.contentView.backgroundColor = Styles.Colors.Main.error.color
        case .info:
            self.contentView.backgroundColor = Styles.Colors.Main.control.color
        case.success:
            self.contentView.backgroundColor = Styles.Colors.Main.success.color
        case .warning:
            self.contentView.backgroundColor = Styles.Colors.Main.warning.color
        }
    }
}
