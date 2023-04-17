//
//  ReminderViewController.swift
//  Today
//
//  Created by Ly Gia Huy on 13/04/2023.
//

import UIKit

class ReminderViewController: UICollectionViewController {
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Row>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Row>

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

    override func viewDidLoad() {
        super.viewDidLoad()
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        datasource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Row) in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        navigationItem.title = NSLocalizedString("Reminder", comment: "Reminder view controller title")

        if #available(iOS 16, *) {
            navigationItem.style = .navigator
        }

        updateSnapshotForViewing()
    }

    private func updateSnapshotForViewing() {
        var snapshot = Snapshot()
        snapshot.appendSections([.view])
        snapshot.appendItems([Row.title, Row.date, Row.time, Row.notes], toSection: .view)
        datasource.apply(snapshot)
    }

    private func updateSnapshotForEditing() {
        var snapshot = Snapshot()
        snapshot.appendSections([.title, .date, .notes])
        datasource.apply(snapshot)
    }

    private func section(for indexPath: IndexPath) -> Section {
        let sectionNumber = isEditing ? indexPath.section + 1 : indexPath.section
        guard let section = Section(rawValue: sectionNumber) else {
            fatalError("Unable to find matching section")
        }
        return section
    }

    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, row: Row) {
        let section = section(for: indexPath)
        switch (section, row) {
        case (.view, _):
        default:
            fatalError("Unexpected combination of section and row")
        }
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
