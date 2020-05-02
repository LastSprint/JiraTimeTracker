//
//  LoadingView.swift
//  JiraTimeTrackerDebug
//

import UIKit

final class LoadingView: UIView {

    private enum Constants {
        static let defaultSize: CGFloat = 64
    }

    private let image = UIImageView()

    init(width: CGFloat, height: CGFloat) {
        super.init(frame: .zero)
        self.configureAppearence(width: width, height: height)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureAppearence(width: Constants.defaultSize, height: Constants.defaultSize)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureAppearence(width: Constants.defaultSize, height: Constants.defaultSize)
    }

    func startAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 0.75
        animation.toValue = 2 * CGFloat.pi
        animation.repeatCount = .infinity
        animation.timingFunction = .some(.init(name: .easeInEaseOut))

        self.image.layer.add(animation, forKey: "animation")
    }

    func stopAnimation() {
        self.image.layer.removeAllAnimations()
    }
}

private extension LoadingView {

    func configureAppearence(width: CGFloat, height: CGFloat) {
        self.image.image = Styles.Image.jiraLogo.image

        self.addSubview(self.image)

        self.image.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.image.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            self.image.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            self.image.heightAnchor.constraint(equalToConstant: height),
            self.image.widthAnchor.constraint(equalToConstant: width)
        ])
    }
}
