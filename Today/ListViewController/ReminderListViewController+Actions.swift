/*
 See LICENSE folder for this sample’s licensing information.
 */

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }

    @objc func didPressAddButton(_: UIBarButtonItem) {
        let reminder = Reminder(title: "", dueDate: Date.now)
        let viewController = ReminderViewController(reminder: reminder, onChange: { [weak self] reminder in
            self?.addReminder(reminder)
            self?.updateSnapshot(reloading: [reminder.id])
            self?.dismiss(animated: true)
        })

        viewController.isAddNewReminder = true
        viewController.setEditing(true, animated: true)
        viewController.navigationItem.leftBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didCancelAdd(_:)))
        viewController.navigationItem.title =
            NSLocalizedString("Add Reminder", comment: "ADd Reminder view controller title")
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true)
    }

    @objc func didCancelAdd(_: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
