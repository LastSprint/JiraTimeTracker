//
//  LoadingSpinnerDisplaybale.swift
//  JiraTimeTrackerDebug
//

import UIKit

protocol LoadingSpinnerDisplaybale {
    func startLoading()
    func stopLoading()
}

extension LoadingSpinnerDisplaybale {
    func show(on view: UIView, width: CGFloat = 64, height: CGFloat = 64) {

        let loadingView = LoadingView(width: width, height: height)
        loadingView.tag = -999

        view.addSubview(loadingView)
        loadingView.isHidden = true
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        view.stretch(view: loadingView)
        loadingView.backgroundColor = Styles.Colors.Main.background.color.withAlphaComponent(0.85)

        loadingView.layer.cornerRadius = view.layer.cornerRadius

        UIView.transition(with: loadingView,
                          duration: 0.25,
                          options: .curveEaseInOut,
                          animations: {
            loadingView.isHidden = false
        }, completion: { isFinished in
            if isFinished {
                loadingView.startAnimation()
            }
        })
    }

    func hide(on view: UIView) {

        guard let loadingView = view.subviews.first(where: { $0.tag == -999 }) as? LoadingView else {
            return
        }

        loadingView.stopAnimation()

        UIView.transition(with: loadingView,
                          duration: 0.25,
                          options: .curveEaseInOut,
                          animations: {
            loadingView.isHidden = true
        }, completion: { isFinished in
            if isFinished {
                loadingView.removeFromSuperview()
            }
        })
    }
}

extension LoadingSpinnerDisplaybale where Self: UIView {
    func startLoading() {
        self.show(on: self)
    }

    func stopLoading() {
        self.hide(on: self)
    }

    func startLoading(spinnerWidth: CGFloat, spinnerHeight: CGFloat) {
        self.show(on: self, width: spinnerWidth, height: spinnerHeight)
    }
}

extension LoadingSpinnerDisplaybale where Self: UIViewController {
    func startLoading() {
        self.show(on: self.view)
    }

    func stopLoading() {
        self.hide(on: self.view)
    }
}
