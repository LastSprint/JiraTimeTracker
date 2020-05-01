//
//  CGFloat.swift
//  JiraTimeTrackerDebug
//

import UIKit

extension CGFloat {

    /// Returns `-1` if the number is less then 0
    /// Return `1` if the number is more then 0
    /// And returns `0` in other cases
    func sign() -> CGFloat {

        if self > 0 {
            return 1
        } else if self < 0 {
            return -1
        } else {
            return 0
        }
    }
}
