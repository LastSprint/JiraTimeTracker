//
//  IssueCellGenerator.swift
//  JiraTimeTrackerDebug
//

import Foundation
import ReactiveDataDisplayManager

final class IssueCellGenerator {

    // MARK: - Events

    var onStartTracking: Closure<IssueEntity>?
    var onEndTracking: Closure<(IssueEntity, Int)>?

    // MARK: - Properties

    private var state: IssueCell.State
    var model: IssueEntity
    private var startDate = Date()

    private lazy var timer = Timer.scheduledTimer(timeInterval: 1,
                                                  target: self,
                                                  selector: #selector(timerFire(_:)),
                                                  userInfo: nil,
                                                  repeats: true)

    private weak var cell: IssueCell?

    // MARK: - Init

    init(model: IssueEntity) {
        self.model = model
        self.state = .stopped
    }

    // MARK: - Public Methods

    func showLoading() {
        self.cell?.startLoading()
    }

    func commitState(seconds: Int) {
        self.cell?.stopLoading()
        self.cell?.setLoged(seconds: seconds)
        self.state = .stopped
        self.cell?.set(state: self.state)
    }

    func restoreState(seconds: Int) {
        self.cell?.stopLoading()
        self.state = .reload(seconds: seconds)
        self.cell?.set(state: self.state)
    }

    func forceStop() {
        guard case IssueCell.State.runned(let seconds) = self.state else {
            return
        }

        self.stopTracking(seconds: seconds)
    }
}

extension IssueCellGenerator: TableCellGenerator {
    var identifier: UITableViewCell.Type {
        IssueCell.self
    }
}

extension IssueCellGenerator: ViewBuilder {

    func build(view: IssueCell) {
        self.cell = view
        view.configure(with: self.model, state: self.state)
        view.onStateChanged = { [weak self] in
            guard let self = self else {
                return
            }

            switch self.state {
            case .runned(let seconds):
                self.stopTracking(seconds: seconds)
            case .stopped:
                self.startTimer()
                self.state = .runned(seconds: 0)
                self.cell?.set(state: self.state)
                self.onStartTracking?(self.model)
            case .reload(let seconds):
                self.stopTracking(seconds: seconds)
            }
        }
    }
}

// MARK: - Private Methods

private extension IssueCellGenerator {
    @objc
    private func timerFire(_ timer: Timer) {
        guard case IssueCell.State.runned = self.state else {
            return
        }

        guard let cell = self.cell else {
            timer.invalidate()
            return
        }

        let resultDate = Int(timer.fireDate.timeIntervalSince1970 - self.startDate.timeIntervalSince1970)

        cell.set(seconds: resultDate)
        self.state = .runned(seconds: resultDate)
    }

    private func startTimer() {
        if !self.timer.isValid {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFire(_:)), userInfo: nil, repeats: true)
        }

        self.startDate = Date()
        self.timer.fire()
    }

    private func stopTimer() {
        self.timer.invalidate()
    }

    func stopTracking(seconds: Int) {
        self.cell?.startLaoding()
        self.stopTimer()
        self.state = .stopped
        self.cell?.set(state: self.state)

        self.onEndTracking?((self.model, seconds))
    }
}
