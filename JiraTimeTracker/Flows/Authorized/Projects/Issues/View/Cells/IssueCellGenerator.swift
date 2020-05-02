//
//  IssueCellGenerator.swift
//  JiraTimeTrackerDebug
//

import Foundation
import ReactiveDataDisplayManager

final class IssueCellGenerator {

    private var state: IssueCell.State
    private var model: IssueEntity
    private var startDate = Date()

    private lazy var timer = Timer.scheduledTimer(timeInterval: 1,
                                                  target: self,
                                                  selector: #selector(timerFire(_:)),
                                                  userInfo: nil,
                                                  repeats: true)

    private weak var cell: IssueCell?

    init(model: IssueEntity) {
        self.model = model
        self.state = .stopped
    }

    @objc
    func timerFire(_ timer: Timer) {
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

    func startTimer() {
        if !self.timer.isValid {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFire(_:)), userInfo: nil, repeats: true)
        }

        self.startDate = Date()
        self.timer.fire()
    }

    func stopTimer() {
        self.timer.invalidate()
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
            case .runned:
                self.stopTimer()
                self.state = .stopped
                self.cell?.set(state: self.state)
            case .stopped:
                self.startTimer()
                self.state = .runned(seconds: 0)
                self.cell?.set(state: self.state)
            }
        }
    }
}
