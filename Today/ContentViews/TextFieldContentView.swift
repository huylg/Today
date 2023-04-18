//
//  TextFieldContentView.swift
//  Today
//
//  Created by Ly Gia Huy on 18/04/2023.
//

import UIKit

class TextFieldContentView: UIView, UIContentView {
    var configuration: UIContentConfiguration
    
    struct Configuration: UIContentConfiguration {
       var text: String? = ""
        
        func makeContentView() -> UIView & UIContentView {
            TextFieldContentView(self)
        }
        
    }
    
    
    let textField = UITextField()
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 0, height: 44)
    }
    
    init(_ configuration: UIContentConfiguration){
        self.configuration = configuration
        super.init(frame: .zero)
        addPinnedSubview(textField, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        textField.clearButtonMode = .whileEditing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(configuration: UIContentConfiguration)  {
        guard let configuration = configuration as? Configuration else { return }
        textField.text = configuration.text
    }
    
}
