//
//  ProgressHeaderView.swift
//  Today
//
//  Created by Ly Gia Huy on 24/04/2023.
//

import UIKit

class ProgressHeaderView: UICollectionReusableView {
    var progress = CGFloat.zero {
        didSet {
            heightContraint?.constant = progress * bounds.height
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.layoutIfNeeded()
            }
        }
    }

    private let upperView = UIView(frame: .zero)
    private let lowerView = UIView(frame: .zero)
    private let containerView = UIView(frame: .zero)
    private var heightContraint: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareSubsView()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func prepareSubsView() {
        containerView.addSubview(upperView)
        containerView.addSubview(lowerView)
        addSubview(containerView)

        upperView.translatesAutoresizingMaskIntoConstraints = false
        lowerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false

        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1).isActive = true

        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true

        upperView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        upperView.bottomAnchor.constraint(equalTo: lowerView.topAnchor).isActive = true
        lowerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        upperView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        upperView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        lowerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        lowerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        heightContraint = lowerView.heightAnchor.constraint(equalToConstant: 0)
        heightContraint?.isActive = true

        backgroundColor = .clear
        containerView.backgroundColor = .clear
        lowerView.backgroundColor = .todayProgressLowerBackground
        upperView.backgroundColor = .todayProgressUpperBackground
    }
}
