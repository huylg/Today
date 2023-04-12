//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by Ly Gia Huy on 12/04/2023.
//

import UIKit

extension ReminderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>

    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id _: String) {
        let reminder = Reminder.sampleData[indexPath.item]
        var cellConfiguration = cell.defaultContentConfiguration()

        cellConfiguration.text = reminder.title
        cellConfiguration.secondaryText = reminder.dueDate.dayAndTimeText
        cellConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        cell.contentConfiguration = cellConfiguration

        var doneConfigurations = doneButtonConfiguration(for: reminder)
        doneConfigurations.tintColor = .todayListCellDoneButtonTint

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
        let button = UIButton()

        button.setImage(image, for: .normal)

        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
}
