//
//  IssueCell.swift
//  JiraTimeTrackerDebug
//

import UIKit
import ReactiveDataDisplayManager

final class IssueCell: UITableViewCell {

    // MARK: - Nested

    enum State {
        case runned(seconds: Int)
        case stopped

        var img: UIImage {
            switch self {
            case .runned:
                return Styles.Image.Issue.stop.image.withRenderingMode(.alwaysTemplate)
            case .stopped:
                return Styles.Image.Issue.play.image.withRenderingMode(.alwaysTemplate)
            }
        }

        var color: UIColor {
            switch self {
            case .runned:
                return Styles.Colors.Main.error.color
            case .stopped:
                return Styles.Colors.Main.success.color
            }
        }

        var time: String {
            switch self {
            case .runned(let seconds):
                return seconds.timerView
            case .stopped:
                return "00:00"
            }
        }
    }

    // MARK: - IBOutlet

    @IBOutlet private weak var priorityImage: UIImageView!
    @IBOutlet private weak var typeImage: UIImageView!
    @IBOutlet private weak var customContent: UIView!
    @IBOutlet private weak var keyLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var timerLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var actionContentView: UIView!
    @IBOutlet private weak var timespantLabel: UILabel!
    @IBOutlet private weak var estimateLabel: UILabel!

    // MARK: - IBActions

    @IBAction
    private func actionButtonTouched() {
        self.onStateChanged?()
    }

    // MARK: - Events

    var onStateChanged: EmptyClosure?

    func set(state: State) {

        self.timerLabel.text = state.time

        UIView.transition(with: self.actionButton, duration: 0.25, options: .curveEaseIn, animations: {
            self.actionButton.setImage(state.img, for: .normal)
            self.actionButton.tintColor = state.color
        }, completion: nil)
    }

    func set(seconds: Int) {
        self.timerLabel.text = seconds.timerView
    }
}

// MARK: - Configuration

extension IssueCell {

    func configure(with model: IssueEntity, state: State) {

        self.configureAppearence()

        self.priorityImage.load(url: model.fields.priority?.iconUrl ?? "")
        self.typeImage.load(url: model.fields.issueType.iconUrl)

        self.keyLabel.text = model.key
        self.titleLabel.text = model.fields.summary
        self.descriptionLabel.text = model.fields.description

        self.estimateLabel.text = L10n.Issues.Labels.Estimate.title(model.fields.aggregatedOriginalEstimate.timeView)
        self.timespantLabel.text = L10n.Issues.Labels.Spent.title(model.fields.timespent.timeView)

        self.keyLabel.apply(for: .title)
        self.titleLabel.apply(for: .subtitle)
        self.descriptionLabel.apply(for: .description)

        self.descriptionLabel.numberOfLines = 3
        self.descriptionLabel.lineBreakMode = .byTruncatingTail

        self.timespantLabel.apply(for: .subtitle)
        self.estimateLabel.apply(for: .subtitle)

        self.actionButton.setImage(state.img, for: .normal)
        self.actionButton.tintColor = state.color

        self.timerLabel.textAlignment = .center
    }
}

private extension IssueCell {

    func configureAppearence() {
        self.actionButton.setImage(Styles.Image.Issue.play.image.withRenderingMode(.alwaysTemplate), for: .normal)
        self.actionButton.setTitle(nil, for: .normal)
        self.actionButton.tintColor = Styles.Colors.Main.success.color

        self.backgroundColor = .clear
        self.customContent.backgroundColor = Styles.Colors.Main.control.color
        self.customContent.layer.borderColor = Styles.Colors.Main.border.color.cgColor
        self.customContent.layer.borderWidth = AppearenceConstants.Main.borderWidth
        self.customContent.layer.cornerRadius = 16
        self.actionContentView.backgroundColor = Styles.Colors.Main.topLevelControl.color
        self.actionContentView.layer.borderColor = Styles.Colors.Main.border.color.cgColor
        self.actionContentView.layer.borderWidth = AppearenceConstants.Main.borderWidth
        self.actionContentView.layer.cornerRadius = 24
    }
}
