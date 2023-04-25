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
}
