//
//  ReminderListStyle.swift
//  Today
//
//  Created by Ly Gia Huy on 24/04/2023.
//

import Foundation

enum ReminderListStyle: Int, CaseIterable {
    case today
    case future
    case all

    var name: String {
        switch self {
        case .all:
            return NSLocalizedString("All", comment: "All style name")
        case .today:
            return NSLocalizedString("Today", comment: "Today style name")
        case .future:
            return NSLocalizedString("Future", comment: "Future style name")
        }
    }

    func shouldInclude(date: Date) -> Bool {
        let isInToday = Locale.current.calendar.isDateInToday(date)
        switch self {
        case .today:
            return isInToday
        case .future:
            return date > Date.now && !isInToday
        case .all:
            return true
        }
    }
}
