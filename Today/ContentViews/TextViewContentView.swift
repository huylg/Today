//
//  TextViewContentView.swift
//  Today
//
//  Created by Ly Gia Huy on 20/04/2023.
//

import UIKit

class TextViewContentView: UIView, UIContentView {
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration)
        }
    }

    struct Configuration: UIContentConfiguration {
        var text: String? = ""

        func makeContentView() -> UIView & UIContentView {
            TextViewContentView(self)
        }
    }

    let textView = UITextView()

    init(_ configuration: Configuration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(textView, height: 200)
        textView.backgroundColor = nil
        textView.font = UIFont.preferredFont(forTextStyle: .body)
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ configuration: UIContentConfiguration) {
        if let configuration = configuration as? Configuration {
            textView.text = configuration.text
        }
    }
}

extension UICollectionViewListCell {
    func textViewConfiguration() -> TextViewContentView.Configuration {
        TextViewContentView.Configuration()
    }
}
