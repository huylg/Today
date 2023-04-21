//
//  DataPickerContentView.swift
//  Today
//
//  Created by Ly Gia Huy on 20/04/2023.
//

import UIKit

class DatePickerContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var date: Date

        var onChange: (Date) -> Void = { _ in }

        func makeContentView() -> UIView & UIContentView {
            DatePickerContentView(self)
        }
    }

    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration)
        }
    }

    var datePicker = UIDatePicker()

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(datePicker)
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(didChange(_:)), for: .valueChanged)
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }

    func configure(_ configuration: UIContentConfiguration) {
        if let configuration = configuration as? Configuration {
            datePicker.date = configuration.date
        }
    }

    @objc private func didChange(_ sender: UIDatePicker) {
        if let configuration = configuration as? Configuration {
            configuration.onChange(sender.date)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UICollectionViewListCell {
    func datePickerContentView(_ date: Date) -> DatePickerContentView.Configuration {
        DatePickerContentView.Configuration(date: date)
    }
}
