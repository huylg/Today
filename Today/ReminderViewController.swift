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
        listConfiguration.headerMode = .firstItemInSection

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
        navigationItem.rightBarButtonItem = editButtonItem

        if #available(iOS 16, *) {
            navigationItem.style = .navigator
        }

        updateSnapshotForViewing()
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            updateSnapshotForEditing()
        } else {
            updateSnapshotForViewing()
        }
    }

    private func updateSnapshotForViewing() {
        var snapshot = Snapshot()
        snapshot.appendSections([.view])
        snapshot.appendItems([Row.header(""), Row.title, Row.date, Row.time, Row.notes], toSection: .view)
        datasource.apply(snapshot)
    }

    private func updateSnapshotForEditing() {
        var snapshot = Snapshot()
        snapshot.appendSections([.title, .date, .notes])
        snapshot.appendItems([.header(Section.title.name), .editableText(reminder.title)], toSection: .title)
        snapshot.appendItems([.header(Section.date.name), .editableDate(reminder.dueDate)], toSection: .date)
        snapshot.appendItems([.header(Section.notes.name), .editableText(reminder.notes)], toSection: .notes)
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
        case let (_, .header(title)):
            cell.contentConfiguration = headerConfiguration(for: cell, with: title)
        case (.view, _):
            cell.contentConfiguration = defaultConfiguration(for: cell, at: row)
        case let (.title, .editableText(title)):
            cell.contentConfiguration = titleConfiguration(for: cell, with: title)
        case let (.date, .editableDate(date)):
            cell.contentConfiguration = dueDateConfiguration(for: cell, with: date)
        case let (.notes, .editableText(notes)):
            cell.contentConfiguration = notesConfiguration(for: cell, with: notes)
        default:
            fatalError("Unexpected combination of section and row")
        }

        cell.tintColor = .todayPrimaryTint
    }
}
