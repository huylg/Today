import UIKit

class TextFieldContentView: UIView, UIContentView {
    struct Configuration: UIContentConfiguration {
        var text: String? = ""

        func makeContentView() -> UIView & UIContentView {
            TextFieldContentView(self)
        }
    }

    let textField = UITextField()

    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration: configuration)
        }
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(textField, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        textField.clearButtonMode = .whileEditing
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(configuration: UIContentConfiguration) {
        if let configuration = configuration as? Configuration {
            textField.text = configuration.text
        }
    }
}

extension UICollectionViewListCell {
    func textFieldConfiguration() -> TextFieldContentView.Configuration {
        TextFieldContentView.Configuration()
    }
}
