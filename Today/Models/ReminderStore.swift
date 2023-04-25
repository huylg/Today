//
//  ReminderStore.swift
//  Today
//
//  Created by Ly Gia Huy on 25/04/2023.
//

import EventKit

final class ReminderStore {
    static let shared = ReminderStore()
    private let ekStore = EKEventStore()

    var isAvaliable: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .authorized
    }

    func requestAccess() async throws {
        let status = EKEventStore.authorizationStatus(for: .reminder)

        switch status {
        case .authorized:
            return

        case .notDetermined:
            let accessGranted = try await ekStore.requestAccess(to: .reminder)
            guard accessGranted else {
                throw TodayError.accessDenied
            }

        case .restricted:
            throw TodayError.accessRestricted

        case .denied:
            throw TodayError.accessDenied

        @unknown default:
            throw TodayError.unknown
        }
    }

    func readAll() async throws -> [Reminder] {
        guard isAvaliable else {
            throw TodayError.accessDenied
        }

        let predicate = ekStore.predicateForReminders(in: nil)

        let ekReminders = try await ekStore.reminders(matching: predicate)
        let reminders = try ekReminders.compactMap {
            do {
                return try Reminder(with: $0)
            } catch TodayError.reminderHasNoDueDate {
                return nil
            }
        }

        return reminders
    }

    private func read(with id: Reminder.ID) throws -> EKReminder {
        guard let reminder = ekStore.calendarItem(withIdentifier: id) as? EKReminder else {
            throw TodayError.failedReadingCalendarItem
        }
        return reminder
    }

    func remove(with id: Reminder.ID) throws {
        guard isAvaliable else {
            throw TodayError.accessDenied
        }
        let ekReminder = try read(with: id)
        try ekStore.remove(ekReminder, commit: true)
    }

    @discardableResult
    func save(_ reminder: Reminder) throws -> Reminder.ID {
        guard isAvaliable else {
            throw TodayError.accessDenied
        }

        let ekReminder: EKReminder
        do {
            ekReminder = try read(with: reminder.id)
        } catch {
            ekReminder = EKReminder(eventStore: ekStore)
        }

        ekReminder.update(using: reminder, in: ekStore)
        try ekStore.save(ekReminder, commit: true)
        return ekReminder.calendarItemIdentifier
    }
}
