//
//  ReminderListController+Actions.swift
//  Today
//
//  Created by Ly Gia Huy on 13/04/2023.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
       guard let id = sender.id else { return }
       completeReminder(withId: id)
    }
}
