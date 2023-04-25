//
//  EKEventStore+AsyncFetch.swift
//  Today
//
//  Created by Ly Gia Huy on 25/04/2023.
//

import Foundation
import EventKit

extension EKEventStore {
    
    func reminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        try await withCheckedThrowingContinuation({ continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders {
                    continuation.resume(returning: reminders)
                } else{
                    continuation.resume(throwing: TodayError.failedReadingReminders)
                }
            }
        })
        
    }

}
