//
//  Reminder+EKReminder.swift
//  Today
//
//  Created by Ly Gia Huy on 25/04/2023.
//

import EventKit
import Foundation

extension Reminder {
    init(with ekReminder: EKReminder) throws {
        guard let duedate = ekReminder.alarms?.first?.absoluteDate else { throw TodayError.reminderHasNoDueDate }
        id = ekReminder.calendarItemIdentifier
        title = ekReminder.title
        dueDate = duedate
        notes = ekReminder.notes
        isComplete = ekReminder.isCompleted
    }
}
