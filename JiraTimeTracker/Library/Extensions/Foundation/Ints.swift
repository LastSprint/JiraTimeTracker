//
//  Strings.swift
//  JiraTimeTrackerDebug
//

import Foundation

extension Int {

    /// Int number shoul be a seconds
    /// Returns view like "1h 25m"
    var timeView: String {

        /// It's 1 hout in seconds
        if self < 3600 {
            let mins = self / 60
            return "\(mins) \(L10n.Issues.Time.Short.minutes)"
        }

        let hours = self / 60 / 60
        let minutes = self / 60 % 60

        return "\(hours) \(L10n.Issues.Time.Short.hours) \(minutes) \(L10n.Issues.Time.Short.minutes)"
    }

    /// Int number shoul be a seconds
    /// Returns view like "1:22:35"
    var timerView: String {
        if self < 3600 {
            let mins = (self / 60).fullTimeView
            let sec = (self % 60).fullTimeView

            return "\(mins):\(sec)"
        }

        let hours = (self / 60 / 60).fullTimeView
        let minutes = (self / 60 % 60).fullTimeView
        let seconds = (self % 60).fullTimeView

        return "\(hours):\(minutes):\(seconds)"
    }

    // if value is less then 10 -> return `05`
    // in other case just returns number
    var fullTimeView: String {
        if self < 10 {
            return "0\(self)"
        }

        return "\(self)"
    }
}
