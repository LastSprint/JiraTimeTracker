//
//  AuthViewController.swift
//  JiraTimeTracker
//

import UIKit
import SurfUtils
import TextFieldsCatalog

final class AuthViewController: UIViewController, AuthViewInput {


    // MARK: - IBOutlets

    @IBOutlet private weak var authButtonBottomCinstraint: NSLayoutConstraint!
    @IBOutlet private weak var logoImage: UIImageView!
    @IBOutlet private weak var loginField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!

    // MARK: - Properties

    var output: AuthViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        self.subscribeOnKeyboardNotifications()
        self.configure()
    }

    // MARK: - AuthViewInput

    func setupInitialState() {

    }
}

extension AuthViewController {
    func showValidationError() {

    }

    func showValiadtionSuccess() {

    }

    func showLoading() {

    }
}

// MARK: - KeyboardObservable

extension AuthViewController: KeyboardObservable {
    func keyboardWillBeShown(notification: Notification) {
        self.animateUIByKeyboard(notification: notification, willHide: false)
    }

    func keyboardWillBeHidden(notification: Notification) {
        self.animateUIByKeyboard(notification: notification, willHide: true)
    }

    private func animateUIByKeyboard(notification: Notification, willHide: Bool) {
        let animationDuration = notification.keyboardInfo.animationDuration ?? 0.1

        guard
            let keyboardHeight = notification.keyboardInfo.frameEnd?.height
        else {
            return
        }

        self.authButtonBottomCinstraint.constant = willHide ? 68 : keyboardHeight

        UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseIn], animations: {
            self.view.layoutIfNeeded()
        })
    }
}

// MARK: - Actions

private extension AuthViewController {

    @objc
    func backgroundTapAction() {
        self.view.endEditing(true)
    }

    @IBAction
    func actionSignInTouchUpInside(_ sender: Any) {

    }
}

// MARK: - Configuration

private extension AuthViewController {
    func configure() {
        self.configureGestureRecognizer()
        self.configureTextFields()

        self.view.backgroundColor = Styles.Colors.Main.background.color

        self.signInButton.setTitle(L10n.Auth.Button.SignIn.title, for: .normal)
        self.signInButton.apply(for: .main)
    }

    func configureTextFields() {

        self.loginField.placeholder = L10n.Auth.TextField.Login.placeholder
        self.passwordField.placeholder = L10n.Auth.TextField.Password.placeholder

        self.loginField.apply(for: .error)
        self.passwordField.apply(for: .main)
    }

    func configureGestureRecognizer() {
        let gr = UITapGestureRecognizer(target: self, action: #selector(self.backgroundTapAction))
        self.view.addGestureRecognizer(gr)
    }
}
