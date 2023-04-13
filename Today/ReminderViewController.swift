//
//  ReminderViewController.swift
//  Today
//
//  Created by Ly Gia Huy on 13/04/2023.
//

import UIKit

class ReminderViewController: UICollectionViewController {
    private typealias DataSource = UICollectionViewDiffableDataSource<Int, Row>
    var reminder: Reminder

    private var datasource: DataSource!

    init(reminder: Reminder) {
        self.reminder = reminder
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false

        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("Always initialize ReminderViewController using init(reminder:)")
    }

    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath _: IndexPath, row: Row) {
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = text(for: row)
        contentConfiguration.textProperties.font = UIFont.preferredFont(forTextStyle: row.textStyle)

        contentConfiguration.image = row.image
        cell.contentConfiguration = contentConfiguration
        cell.tintColor = .todayPrimaryTint
    }

    func text(for row: Row) -> String? {
        switch row {
        case .date:
            return reminder.dueDate.dayText
        case .notes:
            return reminder.notes
        case .time:
            return reminder.dueDate.formatted(date: .omitted, time: .shortened)
        case .title:
            return reminder.title
        }
    }
}
