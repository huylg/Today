//
//  ReminderViewController+Section.swift
//  Today
//
//  Created by Ly Gia Huy on 14/04/2023.
//

import UIKit

extension ReminderViewController {
    enum Section: Int, Hashable {
        case view
        case title
        case date
        case notes

        var name: String {
            switch self {
            case .view: return ""
            case .title:
                return NSLocalizedString("Title", comment: "Title section name")
            case .date:
                return NSLocalizedString("date", comment: "Date section name")
            case .notes:
                return NSLocalizedString("Notes", comment: "Notes section name")
            }
        }
    }
}
