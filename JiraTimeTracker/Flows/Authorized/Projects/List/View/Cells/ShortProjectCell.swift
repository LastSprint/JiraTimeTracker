//
//  ShortProjectCell.swift
//  JiraTimeTrackerDebug
//

import UIKit
import ReactiveDataDisplayManager
import SurfUtils

final class ShortProjectCell: UITableViewCell {

    private let titleLabel = UILabel()
    private let projectNameLabel = UILabel()
    private let projectImg = UIImageView()
    private let customContent = UIView()
    private let descriptionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
    }
}

// MARK: - Configurable

extension ShortProjectCell: Configurable {
    func configure(with model: ShortProjectEntity) {
        self.titleLabel.text = model.key
        self.projectNameLabel.text = model.name
        self.descriptionLabel.text = model.category.description

        self.projectImg.load(url: model.avatarUrls.avatar48x48)
        self.projectImg.tintColor = Styles.Colors.Main.white.color

        self.titleLabel.apply(for: .title)
        self.projectNameLabel.apply(for: .subtitle)
        self.descriptionLabel.apply(for: .description)
    }
}

// MARK: - Configure Appearence

private extension ShortProjectCell {
    func configure() {

        self.addSubview(self.customContent)

        self.customContent.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.customContent.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.customContent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.trailingAnchor.constraint(equalTo: self.customContent.trailingAnchor, constant: 8),
            self.bottomAnchor.constraint(equalTo: self.customContent.bottomAnchor, constant: 8)
        ])

        self.customContent.addSubview(self.projectImg)

        self.projectImg.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            projectImg.widthAnchor.constraint(equalToConstant: 48),
            projectImg.heightAnchor.constraint(equalToConstant: 48),
            projectImg.topAnchor.constraint(equalTo: self.customContent.topAnchor, constant: 16),
            self.customContent.trailingAnchor.constraint(equalTo: projectImg.trailingAnchor, constant: 16)
        ])

        self.customContent.addSubview(self.titleLabel)
        self.customContent.addSubview(self.projectNameLabel)

        self.projectNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.projectImg.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.customContent.leadingAnchor, constant: 16),
            self.projectImg.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: 16),
            self.projectNameLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            self.projectNameLabel.leadingAnchor.constraint(equalTo: self.customContent.leadingAnchor, constant: 16),
            self.projectImg.trailingAnchor.constraint(equalTo: self.projectNameLabel.trailingAnchor, constant: 16)
//            self.customContent.bottomAnchor.constraint(equalTo: self.projectNameLabel.bottomAnchor, constant: 16)
        ])

        self.customContent.addSubview(self.descriptionLabel)
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.projectNameLabel.bottomAnchor, constant: 8),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.customContent.leadingAnchor, constant: 16),
            self.customContent.trailingAnchor.constraint(equalTo: self.descriptionLabel.trailingAnchor, constant: 16),
            self.customContent.bottomAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16)
        ])

        self.backgroundColor = .clear
        self.customContent.backgroundColor = Styles.Colors.Main.control.color
        self.customContent.layer.cornerRadius = 16
        self.customContent.layer.borderColor = Styles.Colors.Main.border.color.cgColor
        self.customContent.layer.borderWidth = AppearenceConstants.Main.borderWidth
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .gray

        self.layoutMargins = .zero
        self.contentView.layoutMargins.left = 26
        self.contentView.layoutMargins.top = 60

        self.projectImg.layer.cornerRadius = 24
        self.projectImg.clipsToBounds = true
    }
}
