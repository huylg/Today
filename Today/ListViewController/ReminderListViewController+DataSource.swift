//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by Ly Gia Huy on 12/04/2023.
//

import UIKit

extension ReminderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Reminder.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Reminder.ID>

    var reminderCompletedValue: String {
        NSLocalizedString("Completed", comment: "Reminder completed value")
    }

    var reminderNotCompletedValue: String {
        NSLocalizedString("Not completed", comment: "Reminder completed value")
    }

    func updateSnapshot(reloading ids: [Reminder.ID] = []) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(reminders.map { $0.id }, toSection: 0)
        if !reminders.isEmpty {
            snapshot.reloadItems(ids)
        }
        dataSource.apply(snapshot)
    }

    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath _: IndexPath, id: Reminder.ID) {
        let reminder = reminder(withId: id)
        var cellConfiguration = cell.defaultContentConfiguration()

        cellConfiguration.text = reminder.title
        cellConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
        cellConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = cellConfiguration

        var doneConfigurations = doneButtonConfiguration(for: reminder)
        doneConfigurations.tintColor = .todayListCellDoneButtonTint
        cell.accessibilityCustomActions = [doneButtonAccessibilityAction(for: reminder)]
        cell.accessibilityValue =
            reminder.isComplete ? reminderCompletedValue : reminderNotCompletedValue

        cell.accessories = [
            .customView(configuration: doneConfigurations),
            .disclosureIndicator(),
        ]

        var backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backgroundConfiguration.backgroundColor = .todayListCellBackground
        cell.backgroundConfiguration = backgroundConfiguration
    }

    private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
        let symbolName = reminder.isComplete ? "circle.fill" : "circle"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        let button = ReminderDoneButton()
        button.id = reminder.id
        button.addTarget(self, action: #selector(didPressDoneButton(_:)), for: .touchUpInside)

        button.setImage(image, for: .normal)

        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }

    func reminder(withId id: Reminder.ID) -> Reminder {
        reminders.first(where: { $0.id == id })!
    }

    func completeReminder(withId id: Reminder.ID) {
        var reminder = reminder(withId: id)
        reminder.isComplete.toggle()
        updateReminder(reminder)
        updateSnapshot(reloading: [id])
    }

    func updateReminder(_ reminder: Reminder) {
        let index = reminders.indexOfReminder(withId: reminder.id)
        reminders[index] = reminder
    }

    private func doneButtonAccessibilityAction(for reminder: Reminder) -> UIAccessibilityCustomAction {
        let name = NSLocalizedString("Toggle comment", comment: "Reminder done button accessibility label")

        let action = UIAccessibilityCustomAction(name: name) { [weak self] _ in
            self?.completeReminder(withId: reminder.id)
            return true
        }

        return action
    }
}
