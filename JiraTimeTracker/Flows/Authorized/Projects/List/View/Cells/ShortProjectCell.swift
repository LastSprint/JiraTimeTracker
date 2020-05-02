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

        self.projectImg.load(url: model.avatarUrls.avatar48x48)

        self.titleLabel.apply(for: .title)
        self.projectNameLabel.apply(for: .subtitle)
    }
}

// MARK: - Configure Appearence

private extension ShortProjectCell {
    func configure() {

        self.addSubview(self.projectImg)

        self.projectImg.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            projectImg.widthAnchor.constraint(equalToConstant: 48),
            projectImg.heightAnchor.constraint(equalToConstant: 48),
            projectImg.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.trailingAnchor.constraint(equalTo: projectImg.trailingAnchor, constant: 16)
        ])

        self.addSubview(self.titleLabel)
        self.addSubview(self.projectNameLabel)

        self.projectNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.projectImg.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.projectImg.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: 16),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.projectNameLabel.topAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            self.projectNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.projectImg.trailingAnchor.constraint(equalTo: self.projectNameLabel.trailingAnchor, constant: 16),
            self.projectNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16)
        ])

        self.backgroundColor = .clear
        self.contentView.backgroundColor = Styles.Colors.Main.control.color
        self.contentView.layer.cornerRadius = 16
        self.contentView.layer.borderColor = Styles.Colors.Main.border.color.cgColor
        self.contentView.layer.borderWidth = AppearenceConstants.Main.borderWidth
        self.selectionStyle = .gray
    }
}
