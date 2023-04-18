//
//  UIView+PinnedSubview.swift
//  Today
//
//  Created by Ly Gia Huy on 18/04/2023.
//

import UIKit

extension UIView {
    func addPinnedSubview(
        _ subview: UIView, height _: CGFloat? = nil, insets _: UIEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    ) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
    }
}
