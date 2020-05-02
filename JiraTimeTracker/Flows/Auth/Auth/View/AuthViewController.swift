//
//  AuthViewController.swift
//  JiraTimeTracker
//

import UIKit
import SurfUtils
import TextFieldsCatalog

final class AuthViewController: UIViewController, AuthViewInput {

    // MARK: - IBOutlets

    @IBOutlet private weak var authButtonBottomConstraint: NSLayoutConstraint!
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
        self.signInButton.isEnabled = false
    }
}

extension AuthViewController {
    func showValidationError() {
        self.loginField.apply(for: .error)
        self.passwordField.apply(for: .error)

    }

    func showValiadtionSuccess() {
        self.signInButton.isEnabled = true
    }

    func showLoading() {
        self.signInButton.isEnabled = false
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 0.75
        animation.toValue = 2 * CGFloat.pi
        animation.repeatCount = .infinity
        animation.timingFunction = .some(.init(name: .easeInEaseOut))

        self.logoImage.layer.add(animation, forKey: "animation")
    }

    func stopLoading() {
        self.signInButton.isEnabled = true
        self.logoImage.layer.removeAllAnimations()
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

        self.authButtonBottomConstraint.constant = willHide ? 68 : keyboardHeight

        if self.authButtonBottomConstraint.constant < 68 {
            self.authButtonBottomConstraint.constant = 68
        }

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
    private func actionSignInTouchUpInside(_ sender: Any) {
        self.output?.onSignIn()
    }
}

extension AuthViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === self.loginField {
            self.passwordField.becomeFirstResponder()
        } else {
            self.view?.endEditing(true)
        }

        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let convertedText = (textField.text ?? "") as NSString

        let resultString = convertedText.replacingCharacters(in: range, with: string)

        if textField === self.loginField {
            self.output?.onLoginChange(value: resultString)
        } else {
            self.output?.onPasswordChange(value: resultString)
        }

        return true
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

        self.loginField.apply(for: .main)
        self.passwordField.apply(for: .main)

        self.loginField.delegate = self
        self.passwordField.delegate = self
    }

    func configureGestureRecognizer() {
        let gr = UITapGestureRecognizer(target: self, action: #selector(self.backgroundTapAction))
        self.view.addGestureRecognizer(gr)
    }
}
